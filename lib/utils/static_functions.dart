import 'package:flutter/material.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/Screens/registration.dart';

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
      MaterialPageRoute(builder: (context) => const LoginPage()), //Make pw Ui
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
