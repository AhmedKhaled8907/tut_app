import 'package:flutter/material.dart';
import 'package:tut_app/presentation/managers/color_manager.dart';
import 'package:tut_app/presentation/managers/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // card View theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appBar theme

    // button theme

    // text theme

    // input decoration theme (text form field)
  );
}
