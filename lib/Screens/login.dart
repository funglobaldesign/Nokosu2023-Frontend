import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/popup_info.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To get the password and username values
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

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
              label: locale.username,
              controller: usernameController,
            ),
            InputField(
              label: locale.password,
              controller: passwordController,
              ispasswordField: true,
            ),
            ButtonSubmit(
              text: locale.login,
              onPressed: login,
            ),
            ButtonLink(
              textLabel: locale.newuser,
              textLink: locale.registerhere,
              onPressed: redirectRegistration,
            ),
            const DropdownL10n()
          ],
        ),
      ),
    );
  }
}
