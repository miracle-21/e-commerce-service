from django.db import models

class TimeStampModel(models.Model):
    created_at  = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class PaymentModel(models.Model):
    user        = models.ForeignKey('User', on_delete = models.CASCADE)
    product     = models.ForeignKey('Product', on_delete = models.CASCADE)
    created_at  = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True