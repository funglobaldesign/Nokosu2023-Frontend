import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/popup_info.dart';
import 'package:nokosu2023/Screens/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To get the password and username values
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
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

  void redirectRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // タイトルを非表示にする
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: 'Username',
              controller: usernameController,
            ),
            InputField(
              label: 'Password',
              controller: passwordController,
              ispasswordField: true,
            ),
            ButtonSubmit(
              text: 'Login',
              onPressed: login,
            ),
            ButtonLink(
              textLabel: 'New User? ',
              textLink: 'Register here',
              onPressed: redirectRegistration,
            )
          ],
        ),
      ),
    );
  }
}
