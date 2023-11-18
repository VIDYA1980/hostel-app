from rest_framework.decorators import api_view, permission_classes
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import User
from .serializers import CustomTokenObtainPairSerializer, UserSerializer
from django.db.models import Q
from rest_framework.permissions import IsAuthenticated, BasePermission, AllowAny

class IsSuperUser(BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_superuser
    
def getTokenAndData(data,user):
    serializer = CustomTokenObtainPairSerializer(data = data)
    if not serializer.is_valid():
        return Response(status=400, data={"error":serializer.errors})

    data = serializer.validated_data
    json = {
        "status": "success",
        "student" : user.is_student,
        "role" : str(user.role),
        "name" : f"{user.first_name} {user.last_name}",
        "college_id": user.reg_or_emp_id,
        "email" : user.email,
        "refresh": str(data['refresh']),
        "access": str(data['access']),
    }

    return Response(status=200 ,data=json)
    

@api_view(["POST"])
@permission_classes([IsAuthenticated, IsSuperUser])
def registerUser(request):

    serializer = UserSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=400)
    
    user  = serializer.save()


    json = {
        "email" : user.email,
        "password" : request.data.get("password")
    }

    return getTokenAndData(json,user)





@api_view(["POST"])
@permission_classes([AllowAny])
def loginUser(request):
    email_or_id = request.data.get("email_or_id")
    password = request.data.get("password")

    if email_or_id is None or password is None:
        return Response(status=400, data= { "Error": "Email or Employee ID or Student Registration number along with password is required." }, )


    user = User.objects.filter(Q(email=email_or_id) | Q(reg_or_emp_id=email_or_id)).first()

    if user is None:
        return Response(status=400, data={"error": "Invalid login credentials"})

    if not user.check_password(password):
        return Response(status=400, data={"error": "Invalid login credentials"})
    
    json = {
        "email" : user.email,
        "password" : password
    }
    return getTokenAndData(json,user)



