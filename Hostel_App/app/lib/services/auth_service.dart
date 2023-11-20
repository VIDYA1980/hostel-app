import 'dart:convert';
import 'package:app/services/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/user.dart';
import 'package:app/services/api_service.dart';
import 'package:app/utilities/snackbar.dart';

class AuthService extends ChangeNotifier {
  User? userData;
  bool authenticated = false;
  final SecureStorage _secureStorage = SecureStorage();

  Future initialize() async {
    userData = await _secureStorage.getUserData();
    authenticated = userData != null;
  }

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
    await _secureStorage.setUserData(userData as User);
    authenticated = true;
    showSucessSnackBar("Successfully Logged In!");

    return authenticated;
  }

  Future logOut() async {
    List<Future> futures = [];
    for (var attribute in User.attributes) {
      futures.add(_secureStorage.storage.delete(key: attribute));
    }
    await Future.wait(futures);
    authenticated = false;
  }
}
