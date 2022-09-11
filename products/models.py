from django.db import models

from core.models import TimeStampModel

class Product(TimeStampModel):
    name            = models.CharField(max_length = 200)
    made            = models.CharField(max_length = 100)
    delivery_mothod = models.CharField(max_length = 100, null = True)
    delivery_charge = models.DecimalField(max_digits = 13, decimal_places = 2, null = True)
    delivery_info   = models.IntegerField(null = True)

    class Meta():
        db_table = 'products'

class ProductImage(models.Model):
    product    = models.ForeignKey('Product', on_delete = models.CASCADE)
    main_img   = models.CharField(max_length = 1000)
    detail_img = models.CharField(max_length = 1000)

    class Meta():
        db_table = 'product_images'

class ProductDetail(models.Model):
    product = models.ForeignKey('Product', on_delete = models.CASCADE)
    name    = models.CharField(max_length = 300)
    price   = models.DecimalField(max_digits = 13, decimal_places = 2)
    count   = models.IntegerField()

    class Meta():
        db_table = 'product_details'