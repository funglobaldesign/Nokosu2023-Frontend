import 'package:flutter/cupertino.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  LocaleProvider() {
    _loadDeviceLocale();
  }

  Future<void> setLocale(Locale locale) async {
    await _saveDeviceLocale(locale);
    notifyListeners();
  }

  Future<void> _loadDeviceLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getString(DeviceMemory.locale) ?? "en";
    _locale = Locale(localeString);
    notifyListeners();
  }

  Future<void> _saveDeviceLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = locale.toLanguageTag();
    await prefs.setString(DeviceMemory.locale, localeString);
    _locale = locale;
  }
}
