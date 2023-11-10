import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenProvider {
  static String _token = "";

  static Future<void> initToken() async {
    await _loadDeviceToken();
  }

  static Future<void> setToken(String token) async {
    await _saveDeviceToken(token);
  }

  static String getToken() {
    return _token;
  }

  static Future<void> _loadDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("AuthToken") ?? "";
  }

  static Future<void> _saveDeviceToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("AuthToken", token!);
    _token = token;
  }
}
