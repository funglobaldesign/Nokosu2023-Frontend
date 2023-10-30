import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/providers/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Nokosu());
}

class Nokosu extends StatelessWidget {
  const Nokosu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, state) {
        return MaterialApp(
          title: 'Nokosu',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Provider.of<LocaleProvider>(context).locale,
          home: const LoginPage(),
        );
      },
    );
  }
}
