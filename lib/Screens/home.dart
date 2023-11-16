import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/bottom_bar.dart';
import 'package:nokosu2023/Components/camera.dart';
import 'package:nokosu2023/Components/top_bar.dart';
import 'package:nokosu2023/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CameraState> cameraKey = GlobalKey();
  late XFile image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Stack(
        children: [
          TopBar(
            w1: Icon(Icons.camera_alt),
            w2: Icon(Icons.camera_alt),
            w3: Icon(Icons.camera_alt),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Camera(key: cameraKey),
                  FloatingActionButton(
                    onPressed: () async {
                      final cameraState = cameraKey.currentState;

                      if (cameraState != null) {
                        image = await cameraState.takePic();
                      }
                    },
                    child: const Icon(Icons.camera_alt),
                  )
                ],
              ),
            ),
          ),
          BottomBar(
            w1: Icon(Icons.camera_alt),
            w2: Icon(Icons.camera_alt),
            w3: Icon(Icons.camera_alt),
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