import 'package:flutter/material.dart';
import 'package:github_issue_manager/core/const/ui_color_const.dart';
import 'package:github_issue_manager/core/const/ui_text_const.dart';

ThemeData get lightTheme {
  return ThemeData(
    useMaterial3: true,
    fontFamily: UITextConst.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: UIColorConst.primary,
    ),
    scaffoldBackgroundColor: UIColorConst.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: UIColorConst.textPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: UITextConst.semiBold,
        fontFamily: UITextConst.fontFamily,
        color: UIColorConst.textPrimary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: UIColorConst.primaryLight.withValues(alpha: 0.7),
      elevation: 50,
    ),
    cardTheme: CardThemeData(
      color: UIColorConst.cardBackground,
      shadowColor: UIColorConst.cardShadow,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: UIColorConst.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: UIColorConst.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: UIColorConst.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: UIColorConst.error),
      ),
      filled: true,
      fillColor: UIColorConst.surface,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: UIColorConst.primaryLight,
      foregroundColor: UIColorConst.textWhite,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: UIColorConst.primary,
        foregroundColor: UIColorConst.textWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: UITextConst.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: UIColorConst.primary,
        textStyle: UITextConst.labelLarge,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: UIColorConst.divider,
      thickness: 1,
    ),
  );
}
