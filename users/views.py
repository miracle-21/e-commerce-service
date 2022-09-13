import json
import bcrypt
import jwt

from django.core.exceptions import ValidationError
from django.http            import JsonResponse
from django.views           import View
from django.conf            import settings
from django.db.models       import Q

from core.validation import *
from core.token      import token_user
from users.models    import User

class SignUpView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)

            name = data['name']
            email = data['email']
            passwd = data['passwd']
            address = data['address']
            phone = data['phone']
            sex = data['sex']

            if User.objects.filter(email=email).exists():
                return JsonResponse({'message' : '이미 존재하는 회원입니다'}, status=409)

            validate_email(email)
            validate_passwd(passwd)
            validate_phone(phone)

            hashed_passwd  = bcrypt.hashpw(passwd.encode('utf-8'), bcrypt.gensalt())
            
            User.objects.create(
                name  = name,
                email = email,
                passwd  = hashed_passwd.decode('utf-8'),
                address = address,
                phone = phone,
                sex = sex
            )
            return JsonResponse({'message' :'회원가입 성공'}, status = 201)
        except ValidationError as error:
            return JsonResponse({'message' : error.message}, status = 400)

class SignInView(View):
    def get(self, request):
        try:
            data = json.loads(request.body)
            
            user = User.objects.get(email=data['email'])

            if not bcrypt.checkpw(data['passwd'].encode('utf-8'), user.passwd.encode('utf-8')):
                return JsonResponse({'message' : '존재하지 않는 회원입니다'}, status = 401)

            access_token = jwt.encode({"id" : user.id}, settings.SECRET_KEY, algorithm = settings.ALGORITHM)

            return JsonResponse({'message' : '로그인 성공'}, headers = {'access_token' : access_token}, status = 200)

        except User.DoesNotExist:
            return JsonResponse({'message' : '존재하지 않는 회원입니다'}, status = 401)

class UserView(View):
    @token_user
    def get(self, request):
        '''
        기능: 기본적으로 일반 회원 정보를 조회할 수 있지만, role=False 로 검색하면 관리자 정보를 조회할 수 있다.
        '''
        if request.user.role == False:
            search = request.GET.get('search')
            role   = request.GET.get('role', True)

            q = Q()

            # 이름, 주소, 성별, 권한(False, True) 검색 기능
            if search:
                q &= Q(name__contains = search) | Q(address__contains = search) | Q(sex__contains = search)
            

            users = User.objects.filter(q).filter(role = role)

            results = [
                {
                    'user_id' : user.id,
                    'name' : user.name,
                    'address' : user.address,
                    'phone' : user.phone,
                    'sex' : "남" if user.sex == False else "여",
                    'role' : "관리자" if user.role == False else "일반회원",
                } for user in users
            ]
            return JsonResponse({'results' : results}, status = 200)
        else:
            return JsonResponse({'message' : '조회 권한이 없습니다'}, status = 401)

    @token_user
    def patch(self, request, id):
        '''
        기능: 회원 정보 수정. 관리자/일반회원 별로 수정 권한이 다르다.
        '''
        user = User.objects.get(id=id)

        # 관리자인 경우 회원의 권한 수정 가능
        if request.user.role == False:
            data = json.loads(request.body)
            user = User.objects.get(id=id)
            user.role = data['role']

            user.save()

            return JsonResponse({'message' : '권한 수정 완료'}, status = 200)

        # 일반 회원인 경우 본인의 주소와 핸드폰 번호 수정 가능
        elif user.id == request.user.id:
            data = json.loads(request.body)
            user = User.objects.get(id=id)

            if 'address' in data.keys():
                user.address  = data['address']
            if 'phone' in data.keys():
                user.phone    = data['phone']
            
            user.save()

            return JsonResponse({'message' : '수정 완료'}, status = 200)

        # 로그인 회원과 수정하고자 하는 회원 정보와 다를 경우
        else:
            return JsonResponse({'message' : '권한이 없습니다'}, status = 401)

    @token_user
    def delete(self, request, id):
        '''
        기능: 본인 가입 정보만 탈퇴할 수 있다.
        '''
        user = User.objects.get(id=id)

        if user.id == request.user.id:
            user.delete()

            return JsonResponse({'message' : '회원탈퇴 완료'}, status = 200)
        else:
            return JsonResponse({'message' : '권한이 없습니다'}, status = 401)