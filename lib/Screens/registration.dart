import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/popup_info.dart';
import 'package:nokosu2023/Screens/login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  void register() {
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

  void redirectLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: 'Username',
              controller: usernameController,
            ),
            InputField(
              label: 'Email',
              controller: emailController,
            ),
            InputField(
              label: 'Password',
              controller: password1Controller,
              ispasswordField: true,
            ),
            InputField(
              label: 'Password Confirmation',
              controller: password2Controller,
              ispasswordField: true,
            ),
            ButtonSubmit(
              text: 'Register',
              onPressed: register,
            ),
            ButtonLink(
              textLabel: 'Already registered? ',
              textLink: 'Login here',
              onPressed: redirectLogin,
            )
          ],
        ),
      ),
    );
  }
}
