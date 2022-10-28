import json

from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

from core.token      import token_user
from products.models import *

class ProductView(View):
    @token_user
    def post(self, request):
        '''
        상품 등록 기능
        TIP: 배송 방법의 기본값은 택배, 배송비 기본값은 0이다.
        NOTICE: 아직 이미지를 2개 이상 올릴 수 없다. 
        '''
        try:
            if request.user.role == False:
                data = json.loads(request.body)

                name            = data['name']
                made            = data['made']
                main_img        = data['main_img']
                detail_img      = data['detail_img']
                detail_name     = data['detail_name']
                price           = data['price']
                count           = data['count']
                delivery_mothod = data['delivery_mothod'] if 'delivery_mothod' in data.keys() else "택배"
                delivery_charge = data['delivery_charge'] if 'delivery_charge' in data.keys() else 0
                delivery_info   = data['delivery_info'] if 'delivery_info' in data.keys() else None

                make = Product.objects.create(
                    name            = name,
                    made            = made,
                    delivery_mothod = delivery_mothod,
                    delivery_charge = delivery_charge,
                    delivery_info   = delivery_info
                )

                ProductImage.objects.create(
                    main_img   = main_img,
                    detail_img = detail_img,
                    product_id = make.id
                )

                ProductDetail.objects.create(
                    name       = detail_name,
                    price      = price,
                    count      = count,
                    product_id = make.id
                )
                return JsonResponse({'message' :'상품 등록 완료'}, status = 201)
            else:
                return JsonResponse({'message' : '권한이 없습니다'}, status = 401)
        except KeyError:
            return JsonResponse({'message' : '등록 정보를 입력하세요'}, status = 400)

    def get(self, request):
        '''
        메인 페이지.
        TIP: id 값을 입력하면 상세 페이지로 사용할 수 있다.
        '''
        search = request.GET.get('search')
        
        q = Q()

        if search:
            q &= Q(name__contains = search)

        # id, 원산지, 배송방법, 배송비(작은값) 기준 필터
        FILTER_SET = {
            'id' : 'id',
            'made' : 'made',
            'delivery_mothod' : 'delivery_mothod',
            'delivery_charge' : 'delivery_charge__lte'
            }
        filter = { FILTER_SET.get(key) : value for key, value in request.GET.items() if FILTER_SET.get(key) }

        products = Product.objects.filter(q).filter(**filter)

        results = [
            {
                'id' : product.id,
                'name' : product.name,
                'made' : product.made,
                'delivery_mothod' : product.delivery_mothod,
                'delivery_charge' : "무료" if product.delivery_charge == 0 else product.delivery_charge if product.delivery_charge == None else int(product.delivery_charge),
                'delivery_info' : product.delivery_info,
                'main_img' : product.productimage_set.get(product_id=product.id).main_img,
                'detail_img' : product.productimage_set.get(product_id=product.id).detail_img,
                'detail_name' : product.productdetail_set.get(product_id=product.id).name,
                'price' : product.productdetail_set.get(product_id=product.id).price,
                'count' : product.productdetail_set.get(product_id=product.id).count,
            } for product in products
        ]
        return JsonResponse({'results' : results}, status = 200)

    @token_user
    def patch(self, request, id):
        '''
        등록상품 수정 기능
        '''
        try:
            if request.user.role == False:
                data = json.loads(request.body)
                product = Product.objects.get(id=id)

                if 'name' in data.keys():
                    product.name = data['name']
                if 'made' in data.keys():
                    product.made = data['made']
                if 'delivery_mothod' in data.keys():
                    product.delivery_mothod = data['delivery_mothod']
                if 'delivery_charge' in data.keys():
                    product.delivery_charge = data['delivery_charge']
                if 'delivery_info' in data.keys():
                    product.delivery_info = data['delivery_info']
                if 'main_img' in data.keys():
                    product.productimage_set.get(product_id=id).main_img = data['main_img']
                if 'detail_img' in data.keys():
                    product.productimage_set.get(product_id=id).detail_img = data['detail_img']
                if 'detail_name' in data.keys():
                    product.productdetail_set.get(product_id=id).name = data['detail_name']
                if 'price' in data.keys():
                    product.productdetail_set.get(product_id=id).price = data['price']
                if 'count' in data.keys():
                    product.productdetail_set.get(product_id=id).count = data['count']
    
                product.save()

                return JsonResponse({'message' : '수정 완료'}, status = 200)
            # 관리자가 아닌 경우
            else:
                return JsonResponse({'message' : '권한이 없습니다'}, status = 401)
        except json.decoder.JSONDecodeError:
            return JsonResponse({'message' : '수정 사항이 없습니다'}, status = 400)

    @token_user
    def delete(self, request, id):
        '''
        등록상품 삭제 기능
        '''
        try:
            product = Product.objects.get(id=id)

            if request.user.role == False:
                product.delete()

                return JsonResponse({'message' : '삭제 완료'}, status = 200)
            else:
                return JsonResponse({'message' : '권한이 없습니다'}, status = 401)
        except Product.DoesNotExist:
            return JsonResponse({'message' : '존재하지 않는 상품입니다'}, status = 400)