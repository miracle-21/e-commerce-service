import jwt

from django.http import JsonResponse

from users.models import User
from market.settings import SECRET_KEY, ALGORITHM

def token_user(func):
    def wrapper(self, request, *args, **kwargs):
        try:
            access_token = request.headers.get('Authorization', None)
            payload = jwt.decode(access_token, SECRET_KEY, ALGORITHM)
            user = User.objects.get(id=payload['id'])
            request.user = user
            return func(self, request, *args, **kwargs)

        except jwt.exceptions.DecodeError:
            return JsonResponse({'message' : '회원 정보 불일치'}, status=401)

        except User.DoesNotExist:
            return JsonResponse({'message' : '존재하지 않는 회원입니다'}, status=401)

    return wrapper