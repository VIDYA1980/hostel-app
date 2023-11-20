import 'package:app/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._self();

  static final SecureStorage _instance = SecureStorage._self();
  factory SecureStorage() => _instance;

  final storage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<User?> getUserData() async {
    Map<String, String> userData = {};
    for (String attribute in User.attributes) {
      String? value = await storage.read(key: attribute);
      if (value == null) return null;
      userData[attribute] = value;
    }

    try {
      User user = User.fromJson(userData);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future setUserData(User user) async {
    Map<String, dynamic> userData = user.toMap();
    List<Future> futures = [];

    userData.forEach((key, value) => futures.add(storage.write(key: key, value: value.toString())));
    await Future.wait(futures);

    return;
  }
}
