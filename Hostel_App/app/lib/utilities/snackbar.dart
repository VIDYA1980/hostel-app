import 'package:app/constants.dart';
import 'package:flutter/material.dart';

void showSnackbar({required String text, required Color color}) {
  if (navigatorKey.currentContext == null) return;

  final snackber = SnackBar(
    content: Center(child: Text(text, style: const TextStyle(fontSize: 16))),
    backgroundColor: color,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  );

  BuildContext curContext = navigatorKey.currentContext as BuildContext;
  ScaffoldMessenger.of(curContext).showSnackBar(snackber);
}

void showAlertSnackBar(String text) => showSnackbar(text: text, color: Colors.redAccent);
void showSucessSnackBar(String text) => showSnackbar(text: text, color: Colors.green);
