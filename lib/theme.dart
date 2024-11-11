import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0x963B82F6); // Vivid Blue
const Color secondaryColor = Color(0xFF10B981); // Emerald Green
const Color backgroundColor = Color(0xFFF3F4F6); // Light Gray
const Color accentColor = Color(0xFFF97316); // Orange
const Color primaryTextColor = Color(0xFF1F2937); // Dark Gray
const Color secondaryTextColor = Color(0xFF6B7280); // Medium Gray
const Color errorColor = Color(0xFFEF4444);
const Color borderColor = Color(0xFF19202C);

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: GoogleFonts.actor(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: accentColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: backgroundColor,
    onPrimary: primaryTextColor,
    onSecondary: secondaryTextColor,
    error: errorColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: primaryTextColor),
    bodyMedium: TextStyle(color: secondaryTextColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor),  // Border color when not focused
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),  // Error color
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    ),
  ),
);
