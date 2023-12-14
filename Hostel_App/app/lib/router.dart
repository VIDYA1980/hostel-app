import 'package:app/Screens/Login/loginScreen.dart';
import 'package:app/Screens/Organization/org_home_screen.dart';
import 'package:app/Screens/Signup/signupScreen.dart';
import 'package:app/Screens/Student/AddComplaint/addComplaintScreen.dart';
import 'package:app/Screens/Student/home_screen.dart';
import 'package:app/Screens/Welcome/welcomeScreen.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class Routers {
  static Widget getDefaultScreen() {
    if (!authService.authenticated) return const WelcomeScreen();
    if (authService.getUserData.isStudent) return const StudentHomeScreen();
    return const OrganizationHomeScreen();
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return routeScreen(const LoginPage());
      case "/signup":
        return routeScreen(SignupPage());
      case "/add-complaint":
        return routeScreen(const ComplaintForm());
      case OrganizationHomeScreen.routeName:
        return routeScreen(const OrganizationHomeScreen());
      case StudentHomeScreen.routeName:
        return routeScreen(const StudentHomeScreen());
      case "/home":
        return routeScreen(getDefaultScreen());
      default:
        return routeScreen(getDefaultScreen());
    }
  }

  static MaterialPageRoute routeScreen(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
