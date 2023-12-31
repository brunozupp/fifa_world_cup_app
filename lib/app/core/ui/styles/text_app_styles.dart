import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextAppStyles {
  static TextAppStyles? _instance;
  
  TextAppStyles._();
  
  static TextAppStyles get i =>
    _instance ??= TextAppStyles._();

  String get primaryFont => "Poppins";

  String get secondaryFont => "MPlus1P";

  // primary font

  TextStyle get textPrimaryFontRegular => TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: primaryFont,
  );

  TextStyle get textPrimaryFontMedium => TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: primaryFont,
  );

  TextStyle get textPrimaryFontSemiBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: primaryFont,
  );

  TextStyle get textPrimaryFontBold => TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: primaryFont,
  );

  TextStyle get textPrimaryFontExtraBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: primaryFont,
  );

  // secondary font

    TextStyle get textSecondaryFontRegular => TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: secondaryFont,
  );

  TextStyle get textSecondaryFontMedium => TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: secondaryFont,
  );

  TextStyle get textSecondaryFontBold => TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: secondaryFont,
  );

  TextStyle get textSecondaryFontExtraBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: secondaryFont,
  );

  TextStyle get textSecondaryFontExtraBoldPrimaryColor => TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: secondaryFont,
    color: ColorsApp.i.primary,
  );

  // others fonts related

  TextStyle get labelTextField => textSecondaryFontRegular.copyWith(
    color: ColorsApp.i.greyDark,
  );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
    color: Colors.white,
    fontSize: 22,
  );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
    color: Colors.black,
    fontSize: 22,
  );

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
    color: ColorsApp.i.primary,
    fontSize: 22,
  );

  
}

extension TextStyleExtension on BuildContext {
  TextAppStyles get textStyles => TextAppStyles.i;
}