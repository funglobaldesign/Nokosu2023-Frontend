import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:provider/provider.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);
  @override
  FolderScreenState createState() => FolderScreenState();
}

class FolderScreenState extends State<FolderScreen> {
  @override
  void initState() {
    Provider.of<HomeStateProvider>(context, listen: false).setState(1);
    Global.isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<HomeStateProvider>(context, listen: false).setState(0);
        RedirectFunctions.redirectHome(context);
        return false;
      },
      child: Scaffold(
        appBar: null,
        backgroundColor: ThemeColours.bgBlueWhite,
        body: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.125,
                child: Container(
                    //child: ,
                    )),
            TopBar(camkey: GlobalKey(), middleIcon: const SizedBox()),
            const BottomBar(),
            if (Global.isLoading) const LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
