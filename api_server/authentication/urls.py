from django.urls import path
from .views import registerUser,loginUser



urlpatterns = [
    path("register/", registerUser, name="Register User"),
    path("login/", loginUser, name="Login User"),
]