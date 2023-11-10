import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenProvider {
  static String _token = "";
  static int _id = 0;

  static Future<void> initToken() async {
    await _loadDeviceToken();
  }

  static Future<void> setToken(String token, id) async {
    await _saveDeviceToken(token, id);
  }

  static String getToken() {
    return _token;
  }

  static int getID() {
    return _id;
  }

  static Future<void> _loadDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("AuthToken") ?? "";
    _id = prefs.getInt("UID") ?? 0;
  }

  static Future<void> _saveDeviceToken(String? token, int? id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("AuthToken", token!);
    await prefs.setInt("UID", id!);
    _token = token;
    _id = id;
  }
}
