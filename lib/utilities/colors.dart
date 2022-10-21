import 'package:flutter/material.dart';

abstract class AppColors {
  static const white = Color(0xffFFFFFF);
  static const red = Color(0xffEC2028);
  static const black = Color(0xff1E272E);
  static const greyDark = Color(0xff747D8C);
  static const twitterBlue = Color(0xff1DA1F2);
  static const fbBlue = Color(0xff3B5998);

  static const lightColorScheme = ColorScheme.light(
    background: white,
    onBackground: black,
    primary: red,
    onPrimary: white,
    surface: red,
    onSurface: white,
  );
}