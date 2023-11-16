import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/Components/bar_bottom.dart';
import 'package:nokosu2023/Components/camera.dart';
import 'package:nokosu2023/Components/bar_top.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:nokosu2023/utils/static_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CameraState> cameraKey = GlobalKey();
  late XFile image;
  int flashMode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.125,
              child: Camera(key: cameraKey)),
          TopBar(
            w1: IconButton(
              icon: Icon(Icons.bookmarks_outlined),
              onPressed: () {
                RedirectFunctions.redirectTutorial(context);
              },
            ),
            w2: IconButton(
              icon: Icon(flashMode == 0
                  ? Icons.flash_off
                  : flashMode == 1
                      ? Icons.flash_auto
                      : Icons.flash_on),
              onPressed: () async {
                final cameraState = cameraKey.currentState;

                if (cameraState != null) {
                  flashMode = await cameraState.toggleFlash();
                  setState(() {});
                }
              },
            ),
            w3: IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ),
          BottomBar(
            w1: IconButton(
              icon: Icon(Icons.photo_library_outlined),
              onPressed: () {},
            ),
            w2: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            w3: IconButton(
              icon: Icon(Icons.supervisor_account_outlined),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15 - 40,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColours.bgBlueWhite,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(6, 6),
                      color: ThemeColours.shadowDark.withOpacity(0.3),
                    )
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    final cameraState = cameraKey.currentState;

                    if (cameraState != null) {
                      image = await cameraState.takePic();
                    }
                  },
                  icon: const Icon(Icons.add_circle_outline_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// onPressed: () async {
//                       final cameraState = cameraKey.currentState;
                 
//                       if (cameraState != null) {
//                         int flashMode = await cameraState.toggleFlash();
               
//                       }
//                     },