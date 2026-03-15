import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSharedPref {
  static const String accessToken = "accessToken";

  static const _securedStorage = FlutterSecureStorage();

  static Future<String> getAccessToken() async {
    return await _securedStorage.read(key: accessToken) ?? '';
  }

  static Future<void> setAccessToken(String token) async {
    return await _securedStorage.write(key: accessToken, value: token);
  }
}
