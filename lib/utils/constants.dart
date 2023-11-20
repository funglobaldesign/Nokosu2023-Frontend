import 'package:flutter/material.dart';

abstract class APILinks {
  static const String base = //"http://127.0.0.1:8000/api/";
      "https://globaldesign2023backend.onrender.com/api/";
}

abstract class ThemeColours {
  // Background colours
  static const Color bgBlueWhite = Color(0xFFEBF3FF);
  static const Color bgWhite = Color(0xFFFFFFFF);

  // Text colours
  static const Color txtBlack = Color(0xFF000000);
  static const Color txtGrey = Color(0x77777777);
  static const Color txtRed = Colors.red;
  static const Color txtWhite = Colors.white;

  // Icon Colours
  static const Color iconBlack = Color(0xFF000000);
  static const Color iconblue = Color(0xFF7AA8FF);

  // Shadow Colours
  static const Color shadowDark = Color(0x88555555);
  static const Color shadowLight = Color(0xFFFFFFFF);

  // Flip Button
  static const Color no = Color(0xFF91BDFF);
  static const Color yes = Color(0xFFFF9191);

  //Others
  static const Color scrollBar = Color(0xAA777777);
  static const Color doneBtn = Color(0xFF2F4266);
}

abstract class NumericConsts {
  static const double defBoxWidth = 250;
  static const double defBoxHeight = 55;
}

abstract class CustIcons {
  static const String logo = 'assets/icons/logo.svg';
  static const String emo = 'assets/icons/heart.svg';
  static const String noemo = 'assets/icons/noheart.svg';
  static const String phys = 'assets/icons/physical.svg';
  static const String nophys = 'assets/icons/nophysical.svg';
  static const String cult = 'assets/icons/cultural.svg';
  static const String nocult = 'assets/icons/nocultural.svg';
  static const String positive = 'assets/icons/positive.svg';
  static const String negative = 'assets/icons/negative.svg';
  static const String capture = 'assets/icons/capture.svg';
}

abstract class Imgs {
  static const String folder = 'assets/imgs/folder.png';
}

abstract class DeviceMemory {
  static const String locale = 'nokosulocale';
  static const String authToken = 'authtoken';
  static const String userID = 'userid';
}

abstract class Errors {
  static const int none = 0;
  static const int badreq = 1;
  static const int unAuth = 2;
  static const int unknown = 3;
}
