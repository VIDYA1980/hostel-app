import 'package:app/components/transparent_text_field.dart';
import 'package:app/constants.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthService authService;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    bool succesfulLogin =
        await authService.login(emailController.text, passwordController.text);
    if (succesfulLogin && navigatorKey.currentContext != null) {
      // print("Logged in as student ${authService.getUserData.isStudent}");
      Navigator.of(navigatorKey.currentContext as BuildContext)
          .pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
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
              TransparentRoundedTextField(
                  controller: emailController, label: 'Email'),
              const SizedBox(height: 15),
              TransparentRoundedTextField(
                  controller: passwordController,
                  label: 'Password',
                  isPassword: true),
              const SizedBox(height: 45),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                  ),
                  child: const Text('Log In',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
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
