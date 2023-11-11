import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;
  static String localeKey = 'nokosulocale';

  LocaleProvider() {
    _loadDeviceLocale();
  }

  Future<void> setLocale(Locale locale) async {
    await _saveDeviceLocale(locale);
    notifyListeners();
  }

  Future<void> _loadDeviceLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getString(localeKey) ?? "en";
    _locale = Locale(localeString);
    notifyListeners();
  }

  Future<void> _saveDeviceLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = locale.toLanguageTag();
    await prefs.setString(localeKey, localeString);
    _locale = locale;
  }
}
