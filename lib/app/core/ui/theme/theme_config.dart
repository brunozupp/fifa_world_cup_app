
import 'package:fifa_world_cup_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_world_cup_app/app/core/ui/styles/text_app_styles.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  
  ThemeConfig._();

  static final InputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      color: ColorsApp.i.greyDark,
      width: 1,
    ),
  );

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextAppStyles.i.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextAppStyles.i.labelTextField,
      border: _defaultBorder,
      enabledBorder: _defaultBorder,
      focusedBorder: _defaultBorder,
    )
  );
}