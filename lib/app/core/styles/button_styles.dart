import 'package:fifa_world_cup_app/app/core/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/styles/text_app_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i =>
    _instance ??= ButtonStyles._();

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.i.yellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    textStyle: TextAppStyles.i.textSecondaryFontExtraBold.copyWith(
      fontSize: 14,
    ),
  );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    side: BorderSide(
      color: ColorsApp.i.yellow,
    ),
    textStyle: TextAppStyles.i.textSecondaryFontExtraBold.copyWith(
      fontSize: 14,
    ),
  );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.i.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    textStyle: TextAppStyles.i.textSecondaryFontExtraBold.copyWith(
      fontSize: 14,
    ),
  );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    side: BorderSide(
      color: ColorsApp.i.primary,
    ),
    textStyle: TextAppStyles.i.textSecondaryFontExtraBold.copyWith(
      fontSize: 14,
    ),
  );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get button => ButtonStyles.i;
}