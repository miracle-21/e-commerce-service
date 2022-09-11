import json
import bcrypt
import jwt

from django.core.exceptions import ValidationError
from django.http import JsonResponse
from django.views import View
from django.conf import settings
from django.db.models import Q

from core.validation import *
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
    '''
    회원 정보 조회 기능
    TO DO: 조회 권한 추가 예정
    '''
    def get(self, request):
        search = request.GET.get('search')

        q = Q()

        if search:
            q &= Q(name__contains = search) | Q(address__contains = search) | Q(sex__contains = search)

        users = User.objects.filter(q)

        results = [
            {
                'user_id' : user.id,
                'name' : user.name,
                'address' : user.address,
                'phone' : user.phone,
                'sex' : user.sex
            } for user in users
        ]
        return JsonResponse({'results' : results}, status = 200)