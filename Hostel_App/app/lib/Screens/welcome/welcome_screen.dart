import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VCB"),
        backgroundColor: const Color.fromARGB(255, 28, 28, 35),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 28, 28, 35),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                'Make your organization complain free with "Virtual Complain Box" ',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width *
                    0.8, // Increase the width
                height: 50, // Increase the height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Make the button more rounded
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Increase the text size
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width *
              //       0.8, // Increase the width
              //   height: 50, // Increase the height
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/login');
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color.fromARGB(255, 81, 81, 81),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(
              //             30), // Make the button more rounded
              //       ),
              //       elevation: 5,
              //     ),
              //     child: const Text(
              //       'I have an account',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18, // Increase the text size
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
