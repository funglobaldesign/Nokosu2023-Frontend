import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/src/constants.dart';
import 'package:nokosu2023/src/staticFunctions.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: locale.username,
              controller: usernameController,
              prefixicon: Icons.person,
            ),
            InputField(
              label: locale.password,
              controller: passwordController,
              ispasswordField: true,
              prefixicon: Icons.lock,
            ),
            ButtonLink(
              textLabel: locale.forgotpw,
              textLink: locale.resethere,
              onPressed: () {
                RedirectFunctions.redirectResetPassword(context);
              },
            ),
            const SizedBox(
              height: 100,
            ),
            ButtonSubmit(
              text: locale.login,
              onPressed: () {
                UtilityFunction.login(
                  context,
                  usernameController,
                  passwordController,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonLink(
              textLabel: locale.newuser,
              textLink: locale.registerhere,
              onPressed: () {
                RedirectFunctions.redirectRegistration(context);
              },
            ),
            const DropdownL10n()
          ],
        ),
      ),
    );
  }
}
