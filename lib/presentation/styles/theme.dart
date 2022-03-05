import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';

class BakerThemes {
  static final base = ThemeData.light();
  static final ThemeData defaultTheme = base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: BakerColors.white,
    scaffoldBackgroundColor: BakerColors.white,
    primaryColor: BakerColors.primary,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: BakerColors.black),
      color: BakerColors.white,
      elevation: 0,
    ),
    dividerColor: BakerColors.darkerGrey,
    bottomAppBarColor: BakerColors.white,
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: BakerColors.white,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: BakerColors.red,
      disabledColor: BakerColors.diasabledButton,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: BakerColors.red,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: base.tabBarTheme.copyWith(
      labelColor: BakerColors.black,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: BakerColors.red,
          width: 2,
        ),
      ),
      labelStyle: BakerTextStyle.header16,

    ),
    cardColor: BakerColors.white,
    errorColor: BakerColors.red,
    textTheme: base.textTheme.apply(
      displayColor: BakerColors.black,
      bodyColor: BakerColors.black,
      fontFamily: BakerFonts.okta,
    ),
    dialogTheme: base.dialogTheme.copyWith(),
    indicatorColor: BakerColors.red,
    textSelectionTheme: base.textSelectionTheme.copyWith(
      selectionColor: BakerColors.red.withOpacity(.3),
      selectionHandleColor: BakerColors.red,
      cursorColor: BakerColors.red,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 3,
      helperMaxLines: 3,
      isDense: true,
      filled: false,
      fillColor: BakerColors.transparent,
      suffixStyle: TextStyle(
        color: BakerColors.text,
      ),
      prefixStyle: TextStyle(
        color: BakerColors.text,
      ),
      labelStyle: TextStyle(
        color: BakerColors.text,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      helperStyle: TextStyle(
        color: BakerColors.text,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        color: BakerColors.text,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: BakerColors.inputBorder, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: BakerColors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: BakerColors.red,
          width: 1.2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: BakerColors.grey,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: BakerColors.darkerGrey, width: 1.2),
      ),
    ),
  );
}
