import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/Components/button_link.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To get the password and username values
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController formErrorController = TextEditingController();
  bool loginSuccess = false;

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Neumo(
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          CustIcons.logo,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                    height: 50,
                  ),
                  ErrorField(err: formErrorController.text),
                  ButtonSubmit(
                    text: locale.login,
                    onPressed: () async {
                      setState(() {
                        Global.isLoading = true;
                      });

                      UserLogin data = UserLogin(
                        username: usernameController.text,
                        password: passwordController.text,
                      );

                      int err = await apiLogin(context, data);

                      if (err == Errors.badreq) {
                        formErrorController.text = locale.erric;
                      } else if (err == Errors.unAuth) {
                        formErrorController.text = locale.errunauth;
                      } else if (err == Errors.unknown) {
                        formErrorController.text = locale.errcrs;
                      } else {
                        formErrorController.text = "";
                        loginSuccess = true;
                      }

                      setState(() {
                        Global.isLoading = false;
                      });

                      if (loginSuccess) {
                        // ignore: use_build_context_synchronously
                        RedirectFunctions.redirectHome(context);
                      }
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
                  const SizedBox(
                    height: 20,
                  ),
                  const DropdownL10n(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            if (Global.isLoading) const LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
