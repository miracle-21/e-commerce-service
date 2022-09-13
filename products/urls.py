from django.urls import path

from products.views import *

urlpatterns = [
    path('/index', ProductView.as_view()),
    path('/index/<int:id>', ProductView.as_view()),
    path('', ProductView.as_view()),
]