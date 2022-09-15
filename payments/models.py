from django.db import models

from core.models     import TimeStampModel
from users.models    import User
from products.models import Product

# 결제 정보 테이블
class Payment(TimeStampModel):
    user    = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete = models.CASCADE)
    price   = models.DecimalField(max_digits = 13, decimal_places = 2)
    count   = models.IntegerField()
    orderer = models.CharField(max_length = 200)
    phone   = models.CharField(max_length = 20)
    address = models.CharField(max_length = 300)
    status  = models.CharField(max_length = 10) 

    class Meta():
        db_table = 'payments'

# 장바구니 테이블
class Cart(TimeStampModel):
    user    = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete = models.CASCADE)
    count   = models.IntegerField()
    price   = models.DecimalField(max_digits = 13, decimal_places = 2)

    class Meta():
        db_table = 'cart'

# 찜 테이블
class Like(TimeStampModel):
    user    = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete = models.CASCADE)
    class Meta():
        db_table = 'like'

# 리뷰 테이블
class Review(TimeStampModel):
    user    = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete = models.CASCADE)
    content = models.TextField()
    
    class Meta():
        db_table = 'reviews'

# 리뷰 이미지 테이블
class ReviewImage(TimeStampModel):
    user    = models.ForeignKey(User, on_delete = models.CASCADE)
    product = models.ForeignKey(Product, on_delete = models.CASCADE)
    review = models.ForeignKey('Review', on_delete = models.CASCADE)
    img    = models.CharField(max_length = 1000, null = True)
     
    class Meta():
        db_table = 'review_images'