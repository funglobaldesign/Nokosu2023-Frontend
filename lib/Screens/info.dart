import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/Components/preview.dart';
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

  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    bool? b = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(locale.photodel),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(locale.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(locale.ok),
            ),
          ],
        );
      },
    );
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? shouldPop = await _showConfirmationDialog(context);
        if (shouldPop != null) {
          return shouldPop;
        }
        return false;
      },
      child: Scaffold(
        appBar: null,
        backgroundColor: ThemeColours.bgBlueWhite,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          PreviewPage(image: widget.image),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
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
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          locale.taptoviewim,
                          style: const TextStyle(
                            color: ThemeColours.txtGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
