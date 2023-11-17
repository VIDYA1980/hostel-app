import 'package:app/Screens/Login/loginScreen.dart';
import 'package:app/Screens/Signup/signupScreen.dart';
import 'package:app/Screens/Student/AddComplaint/addComplaintScreen.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return routeScreen(LoginPage());
      case "/signup":
        return routeScreen(SignupPage());
      case "/add-complaint":
        return routeScreen(ComplaintForm());
      default:
        return null;
    }
  }

  static MaterialPageRoute routeScreen(Widget screen) {
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }
}
