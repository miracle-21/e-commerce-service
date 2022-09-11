from django.urls import path

from users.views import *
urlpatterns = [
    path('/signup', SignUpView.as_view()),
    path('/signin', SignInView.as_view()),
    path('', UserView.as_view()),
]