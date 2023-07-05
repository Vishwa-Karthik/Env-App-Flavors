import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.white,
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kScaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white, size: 30),
        colorScheme: const ColorScheme.light(
          primary: AppColors.white,
          secondary: AppColors.white,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            letterSpacing: 1,
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            color: AppColors.black,
            fontSize: 22,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: AppColors.black,
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          displayMedium: const TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          displaySmall: const TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
          bodySmall: TextStyle(
            fontSize: 12,
            color: AppColors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: AppColors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.white,
        fontFamily: 'PlayFair',
        scaffoldBackgroundColor: AppColors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.orange,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(color: AppColors.black, size: 30),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.black,
          secondary: AppColors.black,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(color: AppColors.black, fontSize: 18),
          bodyMedium: TextStyle(color: AppColors.black, fontSize: 20),
          bodyLarge: TextStyle(color: AppColors.black, fontSize: 22),
        ),
      );
}
