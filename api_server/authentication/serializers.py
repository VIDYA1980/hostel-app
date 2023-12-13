from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from .models import Role, User

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(min_length=8, write_only=True)
    role = serializers.CharField(required=False, allow_blank=True,trim_whitespace=True)

    def create(self, validated_data : dict):
        password = validated_data.pop("password", None)
        role = validated_data.pop("role", None)
        instance = self.Meta.model(**validated_data)
        if role is not None:
            instance.role = Role.objects.get_or_create(name = role)[0]
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance

    class Meta:
        model = User
        fields = [ "reg_or_emp_id", "email", "password", "first_name", "last_name","role"]


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        token['is_student'] = user.is_student
        token['is_superuser'] = user.is_superuser

        return token