from django.db import models

from core.models import TimeStampModel

class User(TimeStampModel):
    name    = models.CharField(max_length = 30)
    email   = models.CharField(max_length = 255, unique = True)
    passwd  = models.CharField(max_length = 100)
    address = models.CharField(max_length = 300)
    phone   = models.CharField(max_length = 20, null = True, unique = True)
    sex     = models.BooleanField()
    role    = models.BooleanField()

    class Meta():
        db_table = 'users'