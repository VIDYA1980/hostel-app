import 'package:app/utilities/customAvatar.dart';
import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';

class UserProfileStatic extends StatelessWidget {
  const UserProfileStatic({super.key});

  Widget _buildTile(String title, Function() onTap, IconData? leadingIcon) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: Icon(leadingIcon),
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('User Profile'),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const customAvatar(
              name: "John Doe",
              url:
                  "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425",
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe', // Random name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'john@example.com', // Random email
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(" | "),
                Text(
                  "123-456-7890",
                  // Random phone number
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 3,
              child: Column(
                children: [
                  _buildTile('My Organizations', () {
                    // Placeholder for navigation
                  }, Icons.account_balance_outlined),
                  _buildTile('Edit Profile', () {
                    // Placeholder for navigation
                  }, Icons.manage_accounts_outlined),
                  _buildTile('Invites', () {
                    // Placeholder for navigation
                  }, Icons.mail_outline_rounded),
                  _buildTile('Notifications', () {
                    // Placeholder for navigation
                  }, Icons.notifications_outlined),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Logout card
            Card(
              elevation: 3,
              color: Colors.red,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Placeholder for logout action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
