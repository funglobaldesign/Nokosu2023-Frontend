import 'package:flutter/material.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:provider/provider.dart';

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
    UserLogin data = UserLogin(
      username: usernameController.text,
      password: passwordController.text,
    );
    var res = await apiLogin(data);
    if (res is Profile) {
      formErrorController.text = "";
      //Set profile state
      RedirectFunctions.redirectHome(context);
    } else {
      formErrorController.text = res;
    }
  }

  static Future<void> register(
    context,
    usernameController,
    emailController,
    firstNameController,
    lastNameController,
    password1Controller,
    password2Controller,
    formErrorController,
  ) async {
    UserReg data = UserReg(
      username: usernameController.text,
      email: emailController.text,
      first_name: firstNameController.text,
      last_name: lastNameController.text,
      password1: password1Controller.text,
      password2: password2Controller.text,
    );
    var res = await apiRegister(data);
    if (res is Profile) {
      formErrorController.text = "";
      //Set profile state
      RedirectFunctions.redirectHome(context);
    } else if (res is UserRegResponse) {
      Provider.of<FormErrProvider>(context, listen: false).updateModel(res);
      formErrorController.text = "1";
    } else {
      formErrorController.text = res;
    }
  }
}
