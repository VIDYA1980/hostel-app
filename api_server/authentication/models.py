
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models


class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email: raise ValueError('The Email field must be set.')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password) 
        user.save(using=self._db) 
        return user 
     
    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_student', False)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('role', Role.objects.get(name='admin') )
        return self.create_user(email, password, **extra_fields)
    

class Role(models.Model):
    name = models.CharField(max_length=50, unique=True, primary_key=True)
    description = models.TextField(null=True, blank=True)

    def __str__(self): 
        return self.name
     
class User(AbstractBaseUser, PermissionsMixin):

    last_login = None
    username = None


    email = models.EmailField(unique=True, null=False)
    first_name = models.CharField(max_length=30,null=False)
    last_name = models.CharField(max_length=30,null=False)
    reg_or_emp_id  = models.CharField(unique=True,null=False)
    role = models.ForeignKey(Role, on_delete=models.PROTECT, default= Role.objects.get(name='student',))
    is_student = models.BooleanField(default=True)
    
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True, editable=False)

    objects = UserManager()

    USERNAME_FIELD = 'email' 
    REQUIRED_FIELDS = ['first_name', 'last_name','reg_or_emp_id',] 

    def __str__(self): 
        return self.reg_or_emp_id