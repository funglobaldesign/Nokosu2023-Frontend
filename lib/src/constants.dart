import 'package:flutter/material.dart';

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

  // Shadow Colours
  static const Color shadowDark = Color(0x88555555);
  static const Color shadowLight = Color(0x88FFFFFF);
}

abstract class NumericConsts {
  static const double borderRad = 50;
  static const double blurRad = 3;
  static const double paddingX = 12;
  static const double paddingY = 5;
}
