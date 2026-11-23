
import 'package:flutter/material.dart';

class AppColors {
  static const aliceBlue = Color(0xFFD8DFE9);
  static const honeydew = Color(0xFFCFDECA);
  static const vanilla = Color(0xFFEFF0A3);
  static const eerieBlack = Color(0xFF212121);
  static const ghostWhite = Color(0xFFF6F5FA);
}

class AppTheme {
  static ThemeData light({required bool isArabic}) {
    final font = isArabic ? 'Cairo' : 'Urbanist';

    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.honeydew,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.eerieBlack,
      onPrimary: AppColors.ghostWhite,
      secondary: AppColors.honeydew,
      onSecondary: AppColors.eerieBlack,
      tertiary: AppColors.vanilla,
      surface: AppColors.ghostWhite,
      onSurface: AppColors.eerieBlack,
      outline: AppColors.aliceBlue,
      outlineVariant: AppColors.aliceBlue,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: font,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.ghostWhite,

      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: font,
        bodyColor: AppColors.eerieBlack,
        displayColor: AppColors.eerieBlack,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.ghostWhite,
        foregroundColor: AppColors.eerieBlack,
        elevation: 0,
        centerTitle: false,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.eerieBlack,
          foregroundColor: AppColors.ghostWhite,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: TextStyle(
            fontFamily: font,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.aliceBlue.withValues(alpha: 0.45),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.eerieBlack,
            width: 1.5,
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.ghostWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(
            color: AppColors.aliceBlue,
          ),
        ),
      ),
    );
  }

  static ThemeData dark({required bool isArabic}) {
    final font = isArabic ? 'Cairo' : 'Urbanist';

    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.honeydew,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.honeydew,
      onPrimary: AppColors.eerieBlack,
      secondary: AppColors.aliceBlue,
      onSecondary: AppColors.eerieBlack,
      tertiary: AppColors.vanilla,
      surface: AppColors.eerieBlack,
      onSurface: AppColors.ghostWhite,
      outline: AppColors.aliceBlue,
      outlineVariant: AppColors.aliceBlue,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: font,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.eerieBlack,

      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: font,
        bodyColor: AppColors.ghostWhite,
        displayColor: AppColors.ghostWhite,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.eerieBlack,
        foregroundColor: AppColors.ghostWhite,
        elevation: 0,
        centerTitle: false,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.honeydew,
          foregroundColor: AppColors.eerieBlack,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: TextStyle(
            fontFamily: font,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.aliceBlue.withValues(alpha: 0.15),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.honeydew,
            width: 1.5,
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.eerieBlack,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: AppColors.aliceBlue.withValues(alpha: 0.35),
          ),
        ),
      ),
    );
  }
}
