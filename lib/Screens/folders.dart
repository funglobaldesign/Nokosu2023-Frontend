import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/group.dart';
import 'package:nokosu2023/Components/SubComponents/group_add.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/group_provider.dart';
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
  List<Group> groups = [];
  late List<Widget> groupWidgets;

  bool groupsReady = false;

  Future<void> getGroups() async {
    await apiGetGroups(context);
  }

  @override
  void initState() {
    Provider.of<HomeStateProvider>(context, listen: false).setState(1);
    Global.isLoading = false;
    getGroups().then((_) async {
      groups = Provider.of<GroupsProvider>(context, listen: false).models;
      groupsReady = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    groupWidgets = groups
        .map((group) => GroupFolder(
              group: group,
              groupController: TextEditingController(),
              groupNameController: TextEditingController(),
              folderView: true,
            ))
        .toList();
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.725,
                  child: groupsReady
                      ? GridView.count(
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: [
                              ...groupWidgets,
                              const GroupAddFolder(folderView: true)
                            ])
                      : const LoadingOverlay(),
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
