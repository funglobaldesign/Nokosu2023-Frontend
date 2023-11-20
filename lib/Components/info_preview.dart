import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:http/http.dart' as http;

class InfoPrevFolder extends StatefulWidget {
  final Info info;

  const InfoPrevFolder({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<InfoPrevFolder> createState() => _InfoPrevState();
}

class _InfoPrevState extends State<InfoPrevFolder> {
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print('View Info BIIIIIIIIG');
        },
        child: SizedBox(
          height: 185,
          width: 120,
          child: Neumo(
            border: 10,
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  child: FutureBuilder(
                      future: http.get(Uri.parse(
                          widget.info.url!)), // Replace with your image URL
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            if (kDebugMode) {
                              print(snapshot.error);
                            }
                            return const Icon(Icons.error);
                          } else {
                            return SizedBox(
                                height: 120,
                                width: 90,
                                child: Image.memory(
                                    snapshot.data?.bodyBytes as Uint8List,
                                    fit: BoxFit.cover));
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.info.topic ?? locale.unnamed,
                  style: const TextStyle(
                    color: ThemeColours.txtBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(widget.info.created!),
                  style: const TextStyle(
                    color: ThemeColours.txtBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
