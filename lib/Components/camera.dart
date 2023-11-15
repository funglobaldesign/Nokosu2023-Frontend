import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';

class Camera extends StatefulWidget {
  final double width;
  final double height;

  const Camera({
    Key? key,
    this.width = 0,
    this.height = 0,
  }) : super(key: key);

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  Future<void> initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
    initializeCamera().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const LoadingOverlay();
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print("Exception : $e");
      }
      return const LoadingOverlay();
    }
  }
}
