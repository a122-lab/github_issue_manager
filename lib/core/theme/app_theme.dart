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
      backgroundColor: UIColorConst.primary,
      foregroundColor: UIColorConst.textWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: UITextConst.semiBold,
        fontFamily: UITextConst.fontFamily,
        color: UIColorConst.textWhite,
      ),
    ),
    cardTheme: CardThemeData(
      color: UIColorConst.surface,
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
      backgroundColor: UIColorConst.primary,
      foregroundColor: UIColorConst.textWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
