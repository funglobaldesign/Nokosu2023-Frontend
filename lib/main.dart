import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/providers/group_provider.dart';
import 'package:nokosu2023/providers/info_provider.dart';
import 'package:nokosu2023/providers/locale_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Nokosu());
}

class Nokosu extends StatelessWidget {
  const Nokosu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => FormErrProvider()),
        ChangeNotifierProvider(create: (context) => TokenProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => GroupProvider()),
        ChangeNotifierProvider(create: (context) => GroupsProvider()),
        ChangeNotifierProvider(create: (context) => InfoProvider()),
        ChangeNotifierProvider(create: (context) => InfosProvider()),
      ],
      builder: (context, state) {
        return MaterialApp(
          title: 'Nokosu',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Provider.of<LocaleProvider>(context).locale,
          home: const HomePage(),
        );
      },
    );
  }
}
