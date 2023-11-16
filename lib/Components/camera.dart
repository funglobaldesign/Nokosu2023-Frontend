import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/loading_overlay.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera extends StatefulWidget {
  final GlobalKey<CameraState> cameraKey = GlobalKey();
  final double width;
  final double height;

  Camera({
    Key? key,
    this.width = 0,
    this.height = 0,
  }) : super(key: key);

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCamAvailable = false;
  int _isFlashOn = 0;
  final int _camIndex = 0;

  Future<void> initializeCamera(int indx) async {
    WidgetsFlutterBinding.ensureInitialized();

    while (!await Permission.camera.request().isGranted) {
      await Permission.location.request();
    }
    while (!await Permission.location.request().isGranted) {
      await Permission.location.request();
    }
    while (!await Permission.storage.request().isGranted) {
      await Permission.location.request();
    }

    cameras = await availableCameras();
    late CameraDescription camera;
    if (indx > cameras.length) {
      camera = cameras.first;
    } else {
      camera = cameras[indx];
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  Future<int> toggleFlash() async {
    try {
      if (_isFlashOn == 0) {
        await _controller.setFlashMode(FlashMode.auto);
        setState(() {
          _isFlashOn = 1;
        });
        return 1;
      } else if (_isFlashOn == 1) {
        await _controller.setFlashMode(FlashMode.torch);
        setState(() {
          _isFlashOn = 2;
        });
        return 2;
      } else {
        await _controller.setFlashMode(FlashMode.off);
        setState(() {
          _isFlashOn = 0;
        });
        return 0;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    initializeCamera(_camIndex).then((_) {
      _isCamAvailable = true;
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
    if (_isCamAvailable) {
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
    } else {
      return const LoadingOverlay();
    }
  }
}
