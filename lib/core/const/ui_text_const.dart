import 'package:flutter/material.dart';

class UITextConst {
  // Font Families
  static const fontFamily = 'Roboto';

  // Font Weights
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;

  // Title Styles
  static const titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: bold,
    fontFamily: fontFamily,
  );

  static const titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: semiBold,
    fontFamily: fontFamily,
  );

  static const titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: semiBold,
    fontFamily: fontFamily,
  );

  // Body Styles
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: regular,
    fontFamily: fontFamily,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: regular,
    fontFamily: fontFamily,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: regular,
    fontFamily: fontFamily,
  );

  // Label Styles
  static const labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: medium,
    fontFamily: fontFamily,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: medium,
    fontFamily: fontFamily,
  );

  static const labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: medium,
    fontFamily: fontFamily,
  );

  // Caption Style
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: regular,
    fontFamily: fontFamily,
  );
}
