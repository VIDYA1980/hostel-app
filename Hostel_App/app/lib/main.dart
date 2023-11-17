import 'package:app/Screens/Welcome/welcomeScreen.dart';
import 'package:app/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Times New Roman" // Use your chosen font
            ),
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        onGenerateRoute: Routers.generateRoute);
  }
}
