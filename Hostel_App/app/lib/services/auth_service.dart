import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/user.dart';
import 'package:app/services/api_service.dart';
import 'package:app/utilities/snackbar.dart';

class AuthService extends ChangeNotifier {
  User? userData;
  bool authenticated = false;

  User get getUserData => userData as User;

  Future<bool> login(String registerNoOrEmail, String password) async {
    http.Response? response = await ApiService.makeRequest(
      endpoint: '/auth/login/',
      method: HttpMethod.post,
      data: {'email_or_id': registerNoOrEmail, 'password': password},
    );

    if (response == null) return false;

    final responseBody = jsonDecode(response.body);
    if (response.statusCode != 200) {
      showAlertSnackBar(responseBody["error"] ?? genericErrorMessage);
      return false;
    }

    userData = User.fromJson(responseBody);
    authenticated = true;
    showSucessSnackBar("Successfully Logged In!");

    return authenticated;
  }
}
