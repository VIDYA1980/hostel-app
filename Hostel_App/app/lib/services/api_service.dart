import 'dart:io';
import 'dart:convert';
import 'package:app/constants.dart';
import 'package:app/utilities/snackbar.dart';
import 'package:http/http.dart' as http;

enum HttpMethod { get, post, put, delete }

class ApiService {
  static const apiBaseUrl = "http://192.168.197.96:8000/api";

  static Future<http.Response?> makeRequest({
    required String endpoint,
    required HttpMethod method,
    dynamic data,
  }) async {
    String url = '$apiBaseUrl$endpoint';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String requestBody = json.encode(data);

    http.Request request = http.Request(_getHttpMethodName(method), Uri.parse(url))
      ..headers.addAll(headers)
      ..body = requestBody;

    try {
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      return response;
    } on SocketException catch (_) {
      showAlertSnackBar('Failed to connect to server.');
    } catch (e) {
      showAlertSnackBar(genericErrorMessage);
    }
    return null;
  }

  static String _getHttpMethodName(HttpMethod method) {
    return method.toString().split(".")[1].toUpperCase();
  }
}
