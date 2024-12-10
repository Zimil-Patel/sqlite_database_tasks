import 'package:flutter/material.dart';

const Color first = Color(0xFFE38E49);
const Color second = Color(0xFF0A3981);
const Color third = Color(0xFF1F509A);
const Color fourth = Color(0xFFD4EBF8);

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: second,
    scaffoldBackgroundColor: fourth,

    // APPBAR
    appBarTheme: const AppBarTheme(
      backgroundColor: second,
      elevation: 10,
      shadowColor: Colors.black54
    ),

    // FLOATING ACTION BUTTON
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: second,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),

    // COLOR SCHEME
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: second,
      secondary: third,
      onSurface: Colors.white,
      surface: first,
    ),
  );
}