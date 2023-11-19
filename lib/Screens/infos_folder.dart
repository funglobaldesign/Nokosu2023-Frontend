import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/group_add_form.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:nokosu2023/api/api.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/group_provider.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/providers/info_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/global_vars.dart';
import 'package:nokosu2023/utils/static_functions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class InfoFolderScreen extends StatefulWidget {
  final Group group;

  const InfoFolderScreen({
    Key? key,
    required this.group,
  }) : super(key: key);
  @override
  InfoFolderScreenState createState() => InfoFolderScreenState();
}

class InfoFolderScreenState extends State<InfoFolderScreen> {
  List<Info> infos = [];
  bool infosReady = false;
  String creator = '';

  late AppLocalizations locale;

  Future<void> getInfos() async {
    //await apiGetGroups(context);
    await apiGetProfile(context, widget.group.createdBy!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    Provider.of<HomeStateProvider>(context, listen: false).setState(1);
    Global.isLoading = false;
    getInfos().then((_) async {
      try {
        infos = Provider.of<InfosProvider>(context, listen: false).models;

        creator = Provider.of<ProfileProvider>(context, listen: false)
            .profile
            .user!
            .username!;

        infosReady = true;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // groupWidgets = groups
    //     .map((group) => GroupFolder(
    //           group: group,
    //           groupController: TextEditingController(),
    //           groupNameController: TextEditingController(),
    //           folderView: true,
    //         ))
    //     .toList();
    return WillPopScope(
      onWillPop: () async {
        Provider.of<HomeStateProvider>(context, listen: false).setState(0);
        RedirectFunctions.redirectFolders(context);
        return true;
      },
      child: Scaffold(
        appBar: null,
        backgroundColor: ThemeColours.bgBlueWhite,
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.125,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.725,
                child: infosReady
                    ? Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: IconButton(
                                      onPressed: () {
                                        RedirectFunctions.redirectFolders(
                                            context);
                                      },
                                      icon: const Icon(Icons.arrow_back)),
                                ),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    constraints: const BoxConstraints(
                                      maxWidth: 200,
                                    ),
                                    child: Text(
                                      widget.group.name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ThemeColours.txtBlack,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                            //  GridView.count(
                            //   padding: const EdgeInsets.all(20),
                            //   crossAxisSpacing: 15,
                            //   mainAxisSpacing: 15,
                            //   crossAxisCount: 3,
                            //   children: [
                            //     ...groupWidgets,
                            //     const GroupAddFolder(folderView: true)
                            //   ],
                            // ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${locale.createdby} : $creator',
                                    style: const TextStyle(
                                      color: ThemeColours.txtGrey,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd HH:mm')
                                        .format(widget.group.created!),
                                    style: const TextStyle(
                                      color: ThemeColours.txtGrey,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const LoadingOverlay(),
              ),
            ),
            TopBar(
                camkey: GlobalKey(),
                middleIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) => GroupFormAdd(
                              isUpdate: true,
                              gid: widget.group.id!,
                            ));
                    setState(() {
                      widget.group.name =
                          Provider.of<GroupProvider>(context, listen: false)
                              .model
                              .name;
                    });
                  },
                )),
            const BottomBar(),
            if (Global.isLoading) const LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
// SizedBox(
//                   height: 40,
//                   child: Neumo(
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             constraints: const BoxConstraints(
//                               maxWidth: 150,
//                             ),
//                             child: Text(
//                               widget.group.name!,
//                               style: const TextStyle(
//                                 color: ThemeColours.txtBlack,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w400,
//                                 decoration: TextDecoration.none,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           GestureDetector(
//                             onTap: () {},
//                             child: const Icon(
//                               Icons.edit,
//                               size: 18,
//                             ),
//                           )
//                         ]),
//                   )),
       