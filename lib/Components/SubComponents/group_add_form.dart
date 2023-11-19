import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Components/button_submit.dart';
import 'package:nokosu2023/Components/input_field.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';

class GroupFormAdd extends StatefulWidget {
  const GroupFormAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<GroupFormAdd> createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupFormAdd> {
  late AppLocalizations locale;

  TextEditingController groupController = TextEditingController();
  bool isloading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 220,
            child: Material(
              color: Colors.transparent,
              child: Neumo(
                onlyBlackShaodw: true,
                border: 10,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    InputField(
                        label: locale.group,
                        controller: groupController,
                        prefixicon: Icons.supervisor_account_outlined),
                    ButtonSubmit(
                        text: locale.submit,
                        onPressed: () async {
                          if (groupController.text.isNotEmpty) {
                            setState(() {
                              isloading = true;
                            });
                            await apiAddgroup(context, groupController.text);
                            setState(() {
                              isloading = false;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isloading) const LoadingOverlay()
      ],
    );
  }
}
