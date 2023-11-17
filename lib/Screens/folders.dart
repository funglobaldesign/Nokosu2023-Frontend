import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);
  @override
  FolderScreenState createState() => FolderScreenState();
}

class FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.125,
              child: Container(
                color: Colors.amber,
              )),
          TopBar(camkey: GlobalKey(), middleIcon: SizedBox()),
          const BottomBar(),
          if (Global.isLoading) const LoadingOverlay(),
        ],
      ),
    );
  }
}
