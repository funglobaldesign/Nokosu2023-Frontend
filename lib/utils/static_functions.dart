import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nokosu2023/Screens/info_view.dart';
import 'package:nokosu2023/Screens/folders.dart';
import 'package:nokosu2023/Screens/home.dart';
import 'package:nokosu2023/Screens/info.dart';
import 'package:nokosu2023/Screens/infos_folder.dart';
import 'package:nokosu2023/Screens/login.dart';
import 'package:nokosu2023/Screens/registration.dart';
import 'package:nokosu2023/Screens/tutorial.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

abstract class RedirectFunctions {
  static void redirectRegistration(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationPage()),
    );
  }

  static void redirectResetPassword(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), //Make pw Ui
    );
  }

  static void redirectLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void redirectHome(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  static void redirectTutorial(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TutorialScreen()),
    );
  }

  static void redirectInfo(context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InfoPage(
                image: path,
              )),
    );
  }

  static void redirectFolders(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FolderScreen()),
    );
  }

  static void redirectInfoFolders(context, Group group) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoFolderScreen(group: group)),
    );
  }

  static void redirectInfoView(context, Info info, Image image) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InfoView(info: info, image: image)),
    );
  }
}

abstract class Gallery {
  static Future<int> saveImage(Uint8List imageData, String folderName) async {
    try {
      Directory dir = await getTemporaryDirectory();
      String fileName =
          '${DateFormat('yyyyMMddHHmmssSSS').format(DateTime.now())}.jpg';
      String filePath = '${dir.path}/$fileName';
      File imageFile = File(filePath);
      await imageFile.writeAsBytes(imageData);

      await GallerySaver.saveImage(filePath, albumName: folderName);
      return 0;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 1;
    }
  }

  static Future<int> saveFolder(List<Info> infos) async {
    try {
      for (var info in infos) {}

      await Future.delayed(Duration(seconds: 3));

      return 0;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 1;
    }
  }
}
