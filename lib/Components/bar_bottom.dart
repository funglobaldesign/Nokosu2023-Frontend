import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  BarState createState() => BarState();
}

class BarState extends State<BottomBar> {
  final picker = ImagePicker();

  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    int homeState = Provider.of<HomeStateProvider>(context).state;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.photo_library_outlined),
                onPressed: () async {
                  XFile image =
                      (await picker.pickImage(source: ImageSource.gallery))!;
                  // ignore: use_build_context_synchronously
                  RedirectFunctions.redirectInfo(context, image.path);
                },
              ),
            ),
            Positioned(
              bottom: 20,
              child: IconButton(
                color: homeState == 0
                    ? ThemeColours.iconblue
                    : ThemeColours.iconBlack,
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  if (homeState != 0) {
                    setState(() {
                      Provider.of<HomeStateProvider>(context, listen: false)
                          .setState(0);
                    });
                    RedirectFunctions.redirectHome(context);
                  }
                },
              ),
            ),
            Positioned(
              right: 30,
              bottom: 20,
              child: IconButton(
                color: homeState == 1
                    ? ThemeColours.iconblue
                    : ThemeColours.iconBlack,
                icon: const Icon(Icons.supervisor_account_outlined),
                onPressed: () {
                  if (homeState != 1) {
                    setState(() {
                      Provider.of<HomeStateProvider>(context, listen: false)
                          .setState(1);
                    });
                    RedirectFunctions.redirectFolders(context);
                  }
                },
              ),
            ),
            if (homeState == 1)
              Positioned(
                  right: 30,
                  bottom: 10,
                  child: Text(
                    locale.groups,
                    style: const TextStyle(
                      color: ThemeColours.iconblue,
                      decoration: TextDecoration.overline,
                      decorationThickness: 2.0,
                    ),
                  )),
            if (homeState == 0)
              Positioned(
                  bottom: 10,
                  child: Text(
                    locale.home,
                    style: const TextStyle(
                      color: ThemeColours.iconblue,
                      decoration: TextDecoration.overline,
                      decorationThickness: 2.0,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}


// if (homeState == 0)
//   Text(
//     locale.home,
//     style: const TextStyle(
//       decoration: TextDecoration.underline,
//     ),
//   ),