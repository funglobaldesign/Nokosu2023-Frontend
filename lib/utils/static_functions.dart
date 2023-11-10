import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/popup_info.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class RedirectFunctions {
  static void redirectRegistration(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  static void redirectResetPassword(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void redirectLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void redirectHome(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}

abstract class UtilityFunctions {
  static Future<void> login(
    context,
    usernameController,
    passwordController,
    formErrorController,
  ) async {
    AppLocalizations locale = AppLocalizations.of(context)!;
    UserLogin data = UserLogin(
        username: usernameController.text, password: passwordController.text);
    var prof = await apiLogin(data);
    if (prof is Profile) {
      formErrorController.text = "";
      RedirectFunctions.redirectHome(context);
    } else if (prof == 1) {
      formErrorController.text = locale.erric;
    } else {
      formErrorController.text = locale.errcrs;
    }
  }

  static void register(
    context,
    usernameController,
    emailController,
    password1Controller,
    password2Controller,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return PopupInfo(
          title: 'Registration Details',
          info:
              'Username is ${usernameController.text}\nEmail is ${emailController.text}\nPassword1 is ${password1Controller.text}\nPassword2 is ${password2Controller.text}',
        );
      },
    );
  }
}
