import 'package:flutter/material.dart';
import 'package:tut_app/presentation/managers/color_manager.dart';
import 'package:tut_app/presentation/managers/font_manager.dart';
import 'package:tut_app/presentation/managers/styles_manager.dart';
import 'package:tut_app/presentation/managers/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, // ripple effect color

    // card View theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),

    // button theme
    

    // text theme

    // input decoration theme (text form field)
  );
}
