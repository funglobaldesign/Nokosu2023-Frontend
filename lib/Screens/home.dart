import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/camera.dart';
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
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
          ],
        ),
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