import 'package:app/Components/transparentTextField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 28, 35),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 28, 28, 35),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Log in to "Virtual Complain Box"',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              TransparentRoundedTextField(label: 'Email'),
              const SizedBox(height: 15),
              TransparentRoundedTextField(label: 'Password', isPassword: true),
              const SizedBox(height: 45),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/add-complaint");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 15),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   height: 50,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/signup');
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color.fromARGB(255, 81, 81, 81),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       elevation: 5,
              //     ),
              //     child: const Text(
              //       'Sign Up',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
