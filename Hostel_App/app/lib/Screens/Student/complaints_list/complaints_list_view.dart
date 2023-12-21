import 'package:flutter/material.dart';
import 'package:app/utilities/palette.dart';

class ComplaintsListView extends StatelessWidget {
  const ComplaintsListView({Key? key}) : super(key: key);

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

    final double cardHeight =
        hostelComplaints.length * 100.0; // Assuming 100 is the tile height

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('List of Complaints'),
        titleTextStyle: TextStyle(color: kPrimaryTextColor, fontSize: 20),
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: cardHeight,
          child: Card(
            color: KListTileColor,
            margin: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: hostelComplaints.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    hostelComplaints[index]['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryTextColor,
                    ),
                  ),
                  subtitle: Text(
                    hostelComplaints[index]['description']!,
                    style: TextStyle(color: kSecondaryTextColor),
                  ),
                  onTap: () {
                    // Add functionality for onTap if needed
                    // For a static page, this could navigate to a new screen
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
