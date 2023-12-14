import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package

class ComplaintForm extends StatefulWidget {
  const ComplaintForm({super.key});

  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  bool toggleAnonymity = false;
  bool showCategoryDescription = false;
  String selecteditem = "Category 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 35),
      appBar: AppBar(
        title: const Text('Add Complaint'),
        backgroundColor: const Color.fromARGB(255, 28, 28, 35),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(51, 78, 78, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10.0),
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Title of the Complaint',
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      DropdownButton<String>(
                        value: selecteditem,
                        underline: Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        dropdownColor: const Color.fromARGB(255, 27, 27, 27),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.white),
                        iconSize: 24,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Category 1',
                            child: Text('Category 1',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Category 2',
                            child: Text('Category 2',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Other',
                            child: Text('Other',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selecteditem = value!;
                            if (value == 'Other') {
                              showCategoryDescription = true;
                            } else {
                              showCategoryDescription = false;
                            }
                          });
                        },
                        hint: const Text('Select Category',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 20.0),
                      Visibility(
                        visible: showCategoryDescription,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelText: 'Category Description',
                                labelStyle: TextStyle(color: Colors.white),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Add Photos regarding complaint',
                                style: TextStyle(color: Colors.white)),
                          ),
                          IconButton(
                            onPressed: () {
                              _getImage(context);
                            },
                            icon: const Icon(Icons.camera_alt,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Anonymity',
                              style: TextStyle(color: Colors.white)),
                          Switch(
                            value: toggleAnonymity,
                            onChanged: (value) {
                              setState(() {
                                toggleAnonymity = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle complaint submission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Submit Your Complaint',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      // Handle the picked image file
    }
  }
}
