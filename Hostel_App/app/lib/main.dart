import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/router.dart';
import 'package:app/constants.dart';
import 'package:app/services/auth_service.dart';

final AuthService authService = AuthService();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AuthService>.value(value: authService)],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          fontFamily: "Times New Roman",
          appBarTheme: const AppBarTheme(backgroundColor: kprimaryColor),
          scaffoldBackgroundColor: kprimaryColor,
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white, fontSize: 16)),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
