import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/camera.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class TopBar extends StatefulWidget {
  final GlobalKey<CameraState> camkey;
  final Widget middleIcon;

  const TopBar({
    Key? key,
    required this.camkey,
    required this.middleIcon,
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
        height: MediaQuery.of(context).size.height * 0.125,
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 20,
          right: 20,
        ),
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
                widget.middleIcon,
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
