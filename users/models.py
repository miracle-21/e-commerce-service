from django.db import models

from core.models import TimeStampModel

# 회원 테이블
class User(TimeStampModel):
    name    = models.CharField(max_length = 30)
    email   = models.CharField(max_length = 255, unique = True)
    passwd  = models.CharField(max_length = 100)
    address = models.CharField(max_length = 300)
    phone   = models.CharField(max_length = 20, null = True, unique = True)
    sex     = models.BooleanField()
    role    = models.BooleanField(default=True) # 일반 회원과 관리자를 구분한다
    credit  = models.DecimalField(max_digits = 13, decimal_places = 2, default=0) # 사이트에서 사용할 수 있는 금액

    class Meta():
        db_table = 'users'