import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/camera.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget {
  final GlobalKey<CameraState> camkey;
  final Widget middleIcon;
  final Widget leftmiddleIcon;
  final Widget rightmiddleIcon;

  const TopBar({
    Key? key,
    required this.camkey,
    required this.middleIcon,
    required this.leftmiddleIcon,
    required this.rightmiddleIcon,
  }) : super(key: key);

  @override
  TopBarState createState() => TopBarState();
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: const EdgeInsets.only(
          bottom: 5,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(color: ThemeColours.bgBlueWhite, boxShadow: [
          if (Provider.of<HomeStateProvider>(context, listen: false).state != 0)
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 6),
              color: ThemeColours.shadowDark.withOpacity(0.5),
            ),
        ]),
        child: ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.bookmarks_outlined),
                  onPressed: () {
                    RedirectFunctions.redirectTutorial(context);
                  },
                ),
                widget.leftmiddleIcon,
                widget.middleIcon,
                widget.rightmiddleIcon,
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
