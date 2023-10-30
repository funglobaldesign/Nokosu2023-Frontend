import 'package:flutter/cupertino.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  LocaleProvider() {
    _locale = const Locale('en');
    print(
        'lib/providers/locale_provider constructor: Get the locale saved in device and assign if not null');
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
