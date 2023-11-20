import 'package:app/models/user.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationHomeScreen extends StatelessWidget {
  const OrganizationHomeScreen({super.key});
  static const routeName = 'organizationHomeScreen';

  @override
  Widget build(BuildContext context) {
    User userData = Provider.of<AuthService>(context).getUserData;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Logged In as ${userData.firstName} ${userData.lastName}"),
          Text("Employee ID : ${userData.regOrEmpID}"),
          Text("Email : ${userData.email}"),
          Text("Role : ${userData.role}"),
          Text("Access Token : ${userData.accessToken}"),
        ],
      ),
    );
  }
}
