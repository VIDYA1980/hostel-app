import 'package:app/models/user.dart';
import 'package:app/screens/student/complaints_list/complaints_list_view.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});
  static const routeName = 'studentHomeScreen';

  @override
  Widget build(BuildContext context) {
    User userData = Provider.of<AuthService>(context).getUserData;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Student Screen", style: TextStyle(fontSize: 19)),
          Text("Logged In as ${userData.firstName} ${userData.lastName}"),
          Text("Registration Number : ${userData.regOrEmpID}"),
          Text("Email : ${userData.email}"),
          Text("Role : ${userData.role}"),
          Text("Access Token : ${userData.accessToken}"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ComplaintsListView(),
                ));
              },
              child: const Text("Complaints List")),
          ElevatedButton(
            onPressed: () async {
              AuthService authService =
                  Provider.of<AuthService>(context, listen: false);
              await authService.logOut();
              if (!context.mounted) return;
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/home", (route) => false);
            },
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}
