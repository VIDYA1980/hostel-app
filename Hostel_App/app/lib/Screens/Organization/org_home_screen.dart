import 'package:app/models/user.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationHomeScreen extends StatefulWidget {
  const OrganizationHomeScreen({super.key});
  static const routeName = 'organizationHomeScreen';

  @override
  State<OrganizationHomeScreen> createState() => _OrganizationHomeScreenState();
}

class _OrganizationHomeScreenState extends State<OrganizationHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    //     _tabController.index = 2;
    //     _tabController.index = _tabController.previousIndex;
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: const [
                      Center(child: Text("Home")),
                      Center(child: Text("Reports")),
                      SizedBox(),
                      Center(child: Text("Calender")),
                      OrganizationHomePage(),
                    ],
                  ),
                ),
                const SizedBox(height: kBottomNavigationBarHeight + 24) //Navbar height + margin on top and bottom
              ],
            ),
          ),
          CustomNavBar(tabController: _tabController)
        ],
      ),
    );
  }
}

class OrganizationHomePage extends StatelessWidget {
  const OrganizationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User userData = Provider.of<AuthService>(context).getUserData;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Organiztion Screen", style: TextStyle(fontSize: 19)),
        Text("Logged In as ${userData.firstName} ${userData.lastName}"),
        Text("Employee ID : ${userData.regOrEmpID}"),
        Text("Email : ${userData.email}"),
        Text("Role : ${userData.role}"),
        Text("Access Token : ${userData.accessToken}"),
        ElevatedButton(
          onPressed: () async {
            AuthService authService = Provider.of<AuthService>(context, listen: false);
            await authService.logOut();
            if (!context.mounted) return;
            Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
          },
          child: const Text("Logout"),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
