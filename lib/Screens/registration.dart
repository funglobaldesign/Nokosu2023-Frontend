import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/staticFunctions.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

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
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                label: locale.username,
                controller: usernameController,
                prefixicon: Icons.person,
              ),
              InputField(
                label: locale.email,
                controller: emailController,
                prefixicon: Icons.email,
              ),
              InputField(
                label: locale.firstname,
                controller: firstNameController,
                prefixicon: Icons.supervisor_account_outlined,
              ),
              InputField(
                label: locale.lastname,
                controller: lastNameController,
                prefixicon: Icons.supervisor_account,
              ),
              InputField(
                label: locale.password,
                controller: password1Controller,
                ispasswordField: true,
                prefixicon: Icons.lock,
              ),
              InputField(
                label: locale.passwordconf,
                controller: password2Controller,
                ispasswordField: true,
                prefixicon: Icons.lock_person,
              ),
              const SizedBox(
                height: 45,
              ),
              ButtonSubmit(
                text: locale.register,
                onPressed: () {
                  UtilityFunction.register(
                      context,
                      usernameController,
                      emailController,
                      password1Controller,
                      password2Controller);
                },
              ),
            ],
          ),
        ),
        const Positioned(
          top: 35,
          left: 25,
          width: 38,
          height: 38,
          child: Neumo(
            child: SizedBox(),
          ),
        ),
        Positioned(
          top: 35,
          left: 25,
          width: 40,
          height: 40,
          child: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined),
            onPressed: () {
              RedirectFunctions.redirectLogin(context);
            },
          ),
        )
      ]),
    );
  }
}
