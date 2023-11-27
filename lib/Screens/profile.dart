import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: null,
        backgroundColor: ThemeColours.bgBlueWhite,
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  int e = await apiLogout(context);
                  if (e == Errors.none) {
                    // ignore: use_build_context_synchronously
                    Provider.of<TokenProvider>(context, listen: false)
                        .setToken('', 0);
                    // ignore: use_build_context_synchronously
                    RedirectFunctions.redirectLogin(context);
                  } else {
                    Fluttertoast.showToast(
                      msg: locale.errcrs,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: ThemeColours.bgWhite,
                      textColor: ThemeColours.txtGrey,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Text(locale.logout))
          ],
        ),
      ),
    );
  }
}
