import 'package:flutter/material.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider extends ChangeNotifier {
  String _token = "";
  int _id = 0;
  String get token => _token;
  int get id => _id;

  TokenProvider() {
    loadDeviceToken();
  }

  Future<void> setToken(String token, int id) async {
    await _saveDeviceToken(token, id);
    notifyListeners();
  }

  Future<void> loadDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(DeviceMemory.authToken) ?? "";
    _id = prefs.getInt(DeviceMemory.userID) ?? 0;
    notifyListeners();
  }

  Future<void> _saveDeviceToken(String token, int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(DeviceMemory.authToken, token);
    await prefs.setInt(DeviceMemory.userID, id);
    _token = token;
    _id = id;
  }
}
