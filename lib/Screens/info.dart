import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/utils/constants.dart';

class InfoPage extends StatefulWidget {
  final Image image;

  const InfoPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              Container(
                padding: const EdgeInsets.all(7),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: ThemeColours.bgBlueWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(-6, -6),
                      color: ThemeColours.shadowDark.withOpacity(0.3),
                    ),
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(6, 6),
                      color: ThemeColours.shadowDark.withOpacity(0.3),
                    )
                  ],
                ),
                child: ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: 1,
                        child: widget.image,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
