// app theme constants
import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.blueAccent;
  static Color textColor = Colors.black;

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xfffbfbfb),
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(color: primaryColor, centerTitle: true),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: textColor),
      bodyLarge: TextStyle(
          fontSize: 24, color: textColor, fontWeight: FontWeight.w600),
    ),
  );
}
