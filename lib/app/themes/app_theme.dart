// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColor,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: boldTextStyle.copyWith(fontSize: 16, color: fontGrey),
    centerTitle: true,
  ),
  textTheme: TextTheme(
    headline1: regularTextStyle.copyWith(fontSize: 32),
    headline2: regularTextStyle.copyWith(fontSize: 20),
    headline3: regularTextStyle.copyWith(fontSize: 18),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
      disabledBackgroundColor: mainColor.withOpacity(.3),
      minimumSize: const Size(double.maxFinite, 58),
      textStyle: boldTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: boldTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      side: const BorderSide(
        color: mainColor,
        width: 1,
      ),
      foregroundColor: mainColor,
      // disabledForegroundColor: mainColor.withOpacity(.3),
      minimumSize: const Size(double.maxFinite, 58),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: mainColor,
      disabledForegroundColor: mainColor.withOpacity(.3),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: semiBoldTextStyle,
      shadowColor: Colors.transparent,
    ),
  ),
  iconTheme: const IconThemeData(
    color: mainColor,
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(mainColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(
      color: secondaryGrey,
      width: 1,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(mainColor),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: mainColor,
    unselectedLabelColor: secondaryGrey,
    labelStyle: boldTextStyle.copyWith(fontSize: 16),
    unselectedLabelStyle: mediumTextStyle.copyWith(fontSize: 16),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white,
    disabledColor: Colors.white,
    selectedColor: Colors.white,
    secondarySelectedColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    side: const BorderSide(color: fifthGrey),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    labelStyle: regularTextStyle.copyWith(fontSize: 12, color: fontGrey),
    secondaryLabelStyle:
        regularTextStyle.copyWith(fontSize: 12, color: secondaryColor),
    deleteIconColor: fontGrey,
    showCheckmark: false,
  ),
  popupMenuTheme: PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(
        color: fifthGrey,
        width: 1,
      ),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: mainColor,
    secondary: secondaryColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: dangerColor,
    onError: dangerColor,
    background: backgroundColor,
  ).copyWith(background: Colors.white),
);
