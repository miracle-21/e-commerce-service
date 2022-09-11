from django.db import models

from core.models import PaymentModel

METHOD = (
    ('1', '카드결제'), 
    ('2', '무통장입금')
    )
STATUS = (
    ('1', '결제완료'),
    ('2', '배송준비중')
    ('3', '배송중'),
    ('4', '배송완료')
)

class Payment(PaymentModel):
    price   = models.DecimalField(max_digits = 13, decimal_places = 2)
    orderer = models.CharField(max_length = 200)
    phone   = models.CharField(max_length = 20)
    address = models.CharField(max_length = 300)
    method  = models.CharField(max_length = 10, choices = METHOD) 
    status  = models.CharField(max_length = 10, choices = STATUS) 

    class Meta():
        db_table = 'payments'

class Cart(PaymentModel):
    count = models.IntegerField()
    price = models.DecimalField(max_digits = 13, decimal_places = 2)

    class Meta():
        db_table = 'cart'

class Like(PaymentModel):

    class Meta():
        db_table = 'like'

class Review(PaymentModel):
    content = models.TextField()
    
    class Meta():
        db_table = 'reviews'

class ReviewImage(PaymentModel):
    review = models.ForeignKey('Review', on_delete = models.CASCADE)
    img    = models.CharField(max_length = 1000, null = True)
     
    class Meta():
        db_table = 'review_images'