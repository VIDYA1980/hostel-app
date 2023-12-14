import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';

class ComplaintsListView extends StatelessWidget {
  const ComplaintsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> hostelComplaints = [
      {
        'title': 'Dirty Common Area',
        'description':
            'The common room is consistently dirty and needs cleaning.'
      },
      {
        'title': 'No Hot Water',
        'description': 'Hot water in bathrooms is not available for days.'
      },
      {
        'title': 'Faulty Locks',
        'description': 'Locks on some doors are broken and need replacement.'
      },
      {
        'title': 'Broken Furniture',
        'description': 'Chairs and tables in the study area need repair.'
      },
      // Add more complaints as needed
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('List of Complaints'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
      ),
      body: ListView.builder(
        itemCount: hostelComplaints.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              hostelComplaints[index]['title']!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(hostelComplaints[index]['description']!),
            onTap: () {
              // Add functionality for onTap if needed
              // For a static page, this could navigate to a new screen
            },
          );
        },
      ),
    );
  }
}
