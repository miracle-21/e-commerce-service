from django.urls import path

from payments.views import *

urlpatterns = [
    path('/<int:product_id>', PaymentView.as_view()),
    path('', PaymentView.as_view()),
    path('/<int:user_id>/<int:payment_id>', PaymentView.as_view())
]