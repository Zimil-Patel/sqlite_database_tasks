import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0xFF0A3981);
const Color secondary = Color(0xFF1F509A);
const Color third = Color(0xFFE38E49);
const Color background = Color(0xFF22212e);

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: background,

    dialogBackgroundColor: background,


    // APPBAR
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.black54
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.varelaRound(),
      titleMedium: GoogleFonts.varelaRound(),
      titleSmall: GoogleFonts.varelaRound(),
      bodyLarge: GoogleFonts.varelaRound(),
      bodyMedium: GoogleFonts.varelaRound(),
      bodySmall: GoogleFonts.varelaRound(),
    ),

    // FLOATING ACTION BUTTON
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),

    // COLOR SCHEME
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primary,
      secondary: secondary,
      onSurface: Colors.white,
      surface: primary,
    ),
  );
}