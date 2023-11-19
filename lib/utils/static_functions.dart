import 'package:flutter/material.dart';
import 'package:nokosu2023/Screens/folders.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/info.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:nokosu2023/Screens/tutorial.dart';

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

  static void redirectTutorial(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TutorialScreen()),
    );
  }

  static void redirectInfo(context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InfoPage(
                image: path,
              )),
    );
  }

  static void redirectFolders(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FolderScreen()),
    );
  }
}
