import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // primary Text Color
    primaryColor: const Color(0xffF1000000),
    iconTheme: const IconThemeData(color: Color(0xff756ef3)),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff0A0C16),
      primaryColor: const Color(0xffFFFFFF),
      iconTheme: const IconThemeData(color: Color(0xff3580FF)),
      elevatedButtonTheme: const ElevatedButtonThemeData());
}
