import json

from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

from core.token      import token_user
from products.models import Product, ProductDetail
from users.models    import User
from payments.models import Payment

class PaymentView(View):
    @token_user
    def post(self, request, product_id):
        '''
        상품 결제 기능

        Notice:
            - 결제 API는 구현하지 못해서 회원 credit에서 금액이 차감되는 형태로 구현.
            - credit도 실제 돈이 들어가야 하니 따로 충전 기능은 구현하지 않은 상태.
        '''
        try:
            product = Product.objects.get(id=product_id)
            user = User.objects.get(id=request.user.id)


            data = json.loads(request.body)
            count = int(data['count'])
            orderer = data['orderer'] if 'orderer' in data.keys() else user.name
            phone = data['phone'] if 'phone' in data.keys() else user.phone
            address = data['address'] if 'address' in data.keys() else user.address

            item = product.productdetail_set.get(product_id=product_id)
            total_price = count * int(item.price)        

            if int(item.count) < count:
                return JsonResponse({'message' : f'해당 상품은 {item.count}개만 남았습니다'}, status = 401)
            elif total_price > int(user.credit):
                return JsonResponse({'message' : '결제 크래딧이 부족합니다'}, status = 401)
            else:
                Payment.objects.create(
                    user_id = user.id,
                    product_id = product_id,
                    price = total_price,
                    orderer = orderer,
                    phone = phone,
                    address = address,
                    status = "결제완료"
                )

                item.count -= count
                user.credit -= total_price
                item.save()
                user.save()
                
            return JsonResponse({'message' : f'{product.name} {count}개, 총 {total_price}원 결제 완료'}, status = 201)
        
        except Product.DoesNotExist:
            return JsonResponse({'message' : '존재하지 않는 상품입니다'}, status = 400)

    @token_user
    def get(self, request):
        '''
        결제 내역 조회
        관리자: 전체 회원 내역 조회 가능, 검색 기능 사용 가능.
        일반회원: 본인 결제 내역만 조회 가능. 검색 기능 사용 가능.
        '''
        address = request.GET.get('address')


        q = Q()

        if address:
            q &= Q(address__contains = address)
        
        FILTER_SET = {
            'product' : 'product',
            'phone' : 'phone',
            'status' : 'status',
            }

        filter = { FILTER_SET.get(key) : value for key, value in request.GET.items() if FILTER_SET.get(key) }
        
        if request.user.role == False:
            payments = Payment.objects.filter(q).filter(**filter)
        else:
            payments = Payment.objects.filter(q).filter(**filter).filter(user_id=request.user.id)

        
        results = [
            {
                'user_id' : payment.user_id,
                'product_id' : payment.product_id,
                'product_name' : ProductDetail.objects.get(product_id=payment.product_id).name,
                'price' : int(payment.price),
                'user_name' : User.objects.get(id=payment.user_id).name,
                'orderer' : payment.orderer,
                'phone' : payment.phone,
                'address' : payment.address,
                'status' : payment.status,
            } for payment in payments
        ]
        return JsonResponse({'results' : results}, status = 200)

