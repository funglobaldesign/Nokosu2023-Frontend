// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/info_render.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoView extends StatefulWidget {
  final Info info;

  const InfoView({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  late AppLocalizations locale;

  bool infosReady = false;
  String creatroName = '';
  Image creatorpfp = Image.asset(Imgs.pfp);

  Future<void> getProfile() async {
    try {
      await apiGetProfile(context, widget.info.createdBy!);
      creatroName = Provider.of<ProfileProvider>(context, listen: false)
          .profile
          .user!
          .username!;
      String pfp =
          Provider.of<ProfileProvider>(context, listen: false).profile.url!;
      if (pfp.isNotEmpty) {
        final response = await http.get(Uri.parse(pfp));
        if (response.statusCode == 200) {
          final imageData = response.bodyBytes;
          creatorpfp = Image.memory(imageData);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    Provider.of<HomeStateProvider>(context, listen: false).setState(1);
    Global.isLoading = false;
    getProfile().then((_) async {
      infosReady = true;

      setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    int currentId = Provider.of<TokenProvider>(context, listen: false).id;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: false,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              TopBar(
                backButton: true,
                camkey: GlobalKey(),
                rightmiddleIcon: currentId == widget.info.createdBy
                    ? IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          print('edit');
                        },
                      )
                    : const SizedBox(),
                middleIcon: IconButton(
                  icon: const Icon(Icons.download_sharp),
                  onPressed: () {
                    print('download info single');
                  },
                ),
                leftmiddleIcon: currentId == widget.info.createdBy
                    ? IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          print('delete info single');
                        },
                      )
                    : const SizedBox(),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: height,
                width: width,
                child: infosReady
                    ? SizedBox(
                        child: InfoSingle(
                            info: widget.info,
                            creator: creatroName,
                            pfp: creatorpfp),
                      )
                    : const LoadingOverlay(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
