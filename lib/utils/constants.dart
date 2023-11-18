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

  // Icon Colours
  static const Color iconBlack = Color(0xFF000000);
  static const Color iconblue = Color(0xFF7AA8FF);

  // Shadow Colours
  static const Color shadowDark = Color(0x88555555);
  static const Color shadowLight = Color(0xFFFFFFFF);

  //Others
  static const Color scrollBar = Color(0xAA777777);
}

abstract class NumericConsts {
  static const double defBoxWidth = 250;
  static const double defBoxHeight = 55;
}

abstract class CustIcons {
  static const String logo = 'assets/icons/logo.svg';
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
  static const int unAuth = 3;
  static const int unknown = 2;
}
