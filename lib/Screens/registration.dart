import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nokosu2023/Components/SubComponents/error_field.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/dropdown_l10n.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:provider/provider.dart';

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
  TextEditingController formErrorController = TextEditingController();
  bool loginSuccess = false;

  final ScrollController _scrollController = ScrollController();

  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    final formErrProvider =
        Provider.of<FormErrProvider>(context).userRegResponse;
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.75,
                child: RawScrollbar(
                  controller: _scrollController,
                  thumbColor: ThemeColours.scrollBar,
                  radius: const Radius.circular(50),
                  thickness: 8.5,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16.0),
                    physics: const ClampingScrollPhysics(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InputField(
                            label: locale.username,
                            controller: usernameController,
                            prefixicon: Icons.person,
                            err: formErrProvider.username!.message!,
                          ),
                          InputField(
                            label: locale.email,
                            controller: emailController,
                            prefixicon: Icons.email,
                            err: formErrProvider.email!.message!,
                          ),
                          InputField(
                            label: locale.firstname,
                            controller: firstNameController,
                            prefixicon: Icons.supervisor_account_outlined,
                            err: formErrProvider.first_name!.message!,
                          ),
                          InputField(
                            label: locale.lastname,
                            controller: lastNameController,
                            prefixicon: Icons.supervisor_account,
                            err: formErrProvider.last_name!.message!,
                          ),
                          InputField(
                            label: locale.password,
                            controller: password1Controller,
                            ispasswordField: true,
                            prefixicon: Icons.lock,
                            err: formErrProvider.password1!.message!,
                          ),
                          InputField(
                            label: locale.passwordconf,
                            controller: password2Controller,
                            ispasswordField: true,
                            prefixicon: Icons.lock_person,
                            err: formErrProvider.password2!.message!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ErrorField(err: formErrorController.text),
              ButtonSubmit(
                text: locale.register,
                onPressed: () async {
                  setState(() {
                    Global.isLoading = true;
                  });

                  if (usernameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      password1Controller.text.isEmpty ||
                      password2Controller.text.isEmpty) {
                    formErrorController.text = locale.allFieldsRequired;
                  } else {
                    UserReg data = UserReg(
                      username: usernameController.text,
                      email: emailController.text,
                      first_name: firstNameController.text,
                      last_name: lastNameController.text,
                      password1: password1Controller.text,
                      password2: password2Controller.text,
                    );

                    int err = await apiRegister(context, data);

                    if (err == 1) {
                      formErrorController.text = locale.errfix;
                    } else if (err == 2) {
                      formErrorController.text = locale.errcrs;
                    } else {
                      formErrorController.text = "";
                      loginSuccess = true;
                    }
                  }
                  Global.isLoading = false;
                  setState(() {});

                  if (loginSuccess) {
                    // ignore: use_build_context_synchronously
                    RedirectFunctions.redirectHome(context);
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const DropdownL10n()
            ],
          ),
        ),
        if (Global.isLoading) const LoadingOverlay(),
        const Positioned(
          top: 35,
          left: 25,
          width: 42,
          height: 42,
          child: Neumo(
            child: SizedBox(),
          ),
        ),
        Positioned(
          top: 37,
          left: 27,
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
