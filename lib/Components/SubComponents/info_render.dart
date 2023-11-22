import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _openMaps(double latitude, double longitude) async {
    String mapsUrl = '${APILinks.maps}$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(mapsUrl))) {
      await launchUrl(Uri.parse(mapsUrl));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    double fixedheight = 800;
    double fixedwidth = 400;

    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: ThemeColours.bgBlueWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0,
                color: Colors.transparent,
              ),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(-6, -6),
                    color: ThemeColours.shadowDark),
                BoxShadow(
                  blurRadius: 6,
                  offset: Offset(6, 6),
                  color: ThemeColours.shadowDark,
                ),
              ]),
          height: fixedheight,
          width: fixedwidth,
          child: Column(
            children: [
              FutureBuilder(
                  future: http.get(Uri.parse(widget.info.url!)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        if (kDebugMode) {
                          print(snapshot.error);
                        }
                        return const Icon(Icons.error);
                      } else {
                        return SizedBox(
                          width: 400,
                          height: 550,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.memory(
                              snapshot.data?.bodyBytes as Uint8List,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              Container(
                height: 20,
                width: fixedwidth,
                color: widget.info.positive!
                    ? ThemeColours.positive
                    : ThemeColours.negative,
                child: Text(
                  widget.info.positive! ? locale.positive : locale.negative,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColours.txtWhite.withOpacity(0.3),
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                height: 50,
                width: fixedwidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: ThemeColours.negative,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: SvgPicture.asset(CustIcons.phys),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _openMaps(
                            widget.info.latitude!, widget.info.longitude!);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.add_location_alt_outlined),
                          Column(
                            children: [
                              Text(widget.info.address!,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200)),
                              Text(widget.info.location!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                width: fixedwidth,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
