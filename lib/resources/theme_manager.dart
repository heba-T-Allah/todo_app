import 'package:flutter/material.dart';
import 'package:todo_app/resources/styles_manager.dart';
import 'package:todo_app/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.primaryLight,

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryLight,
      // titleTextStyle:
      //     getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryLight,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
    //text theme
    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.primaryDark, fontSize: FontSize.s16),
        titleMedium: getSemiBoldStyle(
            color: ColorManager.grey, fontSize: FontSize.s18),
        bodyMedium: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s18),
        //button
        headlineMedium:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s20),
        bodyLarge: getRegularStyle(color: ColorManager.white),
        bodySmall: getRegularStyle(color: ColorManager.hintBlack,fontSize: FontSize.s16),),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      //label style
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      //error style
      errorStyle:
          getMediumStyle(color: ColorManager.error, fontSize: FontSize.s14),
      //enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
