import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class InfoSingle extends StatefulWidget {
  final Info info;
  final String creator;
  final Image pfp;

  const InfoSingle({
    Key? key,
    required this.info,
    required this.creator,
    required this.pfp,
  }) : super(key: key);

  @override
  State<InfoSingle> createState() => _InfoSinglePageState();
}

class _InfoSinglePageState extends State<InfoSingle> {
  late AppLocalizations locale;

  @override
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
        child: SingleChildScrollView(
          child: Column(
            children: [widget.pfp, Text(widget.creator)],
          ),
        ),
      ),
    );
  }
}
