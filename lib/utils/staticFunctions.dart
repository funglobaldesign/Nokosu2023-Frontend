import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/popup_info.dart';
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
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void redirectLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}

abstract class UtilityFunctions {
  static void login(
    context,
    usernameController,
    passwordController,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return PopupInfo(
          title: 'Login Details',
          info:
              'Username is ${usernameController.text}\nPassword is ${passwordController.text}',
        );
      },
    );
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
