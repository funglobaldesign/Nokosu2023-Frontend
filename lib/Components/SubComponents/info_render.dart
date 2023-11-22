import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
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
          height: fixedheight,
          width: fixedwidth,
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
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: widget.info.emotion!
                                  ? ThemeColours.positive
                                  : ThemeColours.negative,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: SvgPicture.asset(
                              widget.info.emotion!
                                  ? CustIcons.emo
                                  : CustIcons.noemo,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: widget.info.physical!
                                  ? ThemeColours.positive
                                  : ThemeColours.negative,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: SvgPicture.asset(
                              widget.info.physical!
                                  ? CustIcons.phys
                                  : CustIcons.phys,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: widget.info.cultural!
                                  ? ThemeColours.positive
                                  : ThemeColours.negative,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: SvgPicture.asset(
                              widget.info.cultural!
                                  ? CustIcons.cult
                                  : CustIcons.cult,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
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
                height: 150,
                width: fixedwidth,
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.info.topic!,
                      style: const TextStyle(
                        color: ThemeColours.txtBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.info.description!,
                        style: const TextStyle(
                          color: ThemeColours.txtBlack,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: fixedwidth,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d, y h:mm a')
                          .format(widget.info.created!),
                      style: const TextStyle(
                        color: ThemeColours.txtBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        decoration: TextDecoration.none,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 0.6,
                            ),
                          ),
                          child: ClipOval(
                            child: widget.pfp,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.creator,
                          style: const TextStyle(
                            color: ThemeColours.txtBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
