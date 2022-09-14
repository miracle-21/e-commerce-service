import json

from django.http      import JsonResponse
from django.views     import View

from core.token      import token_user
from products.models import Product
from users.models    import User
from payments.models import Payment

class PaymentView(View):
    @token_user
    def post(self, request, product_id):
        '''
        기능: 상품 결제 기능. 유저 정보는 따로 명시하지 않는 이상 가입된 기본 정보를 가지고 온다.
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
                    status = '1'
                )

                item.count -= count
                user.credit -= total_price
                item.save()
                user.save()
                
            return JsonResponse({'message' : f'{product.name} {count}개, 총 {total_price}원 결제 완료'}, status = 201)
        
        except Product.DoesNotExist:
            return JsonResponse({'message' : '존재하지 않는 상품입니다'}, status = 400)