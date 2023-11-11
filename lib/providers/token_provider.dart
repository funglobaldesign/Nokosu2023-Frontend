import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider extends ChangeNotifier {
  String _token = "";
  int _id = 0;
  String get token => _token;
  int get id => _id;

  TokenProvider() {
    _loadDeviceToken();
  }

  Future<void> setToken(String token, int id) async {
    await _saveDeviceToken(token, id);
    notifyListeners();
  }

  Future<void> _loadDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("AuthToken") ?? "";
    _id = prefs.getInt("UID") ?? 0;
    notifyListeners();
  }

  Future<void> _saveDeviceToken(String token, int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("AuthToken", token);
    await prefs.setInt("UID", id);
    _token = token;
    _id = id;
  }
}
