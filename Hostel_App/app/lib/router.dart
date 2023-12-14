import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/organization/org_home_screen.dart';
import 'package:app/screens/signup/signup_screen.dart';
import 'package:app/screens/student/add_complaint/add_complaints.dart';
import 'package:app/screens/student/home_screen.dart';
import 'package:app/main.dart';
import 'package:app/screens/welcome/welcome_screen.dart';
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
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }
}
