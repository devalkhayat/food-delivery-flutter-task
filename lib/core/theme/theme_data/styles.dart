import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants.dart' as consts;
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

class Styles {
  Styles._();

  static const headlineLarge = TextStyle(
      color: colors.white,
      fontSize: 64,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.bold,
      height: 1);

  static const headlineSmall = TextStyle(
      color: colors.white,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      height: 1.5);

  static const elevatedButton = ButtonStyle(
      textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
      backgroundColor: WidgetStatePropertyAll<Color>(colors.primaryColor),
      foregroundColor: WidgetStatePropertyAll<Color>(colors.white),
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.only(top: 5.0, bottom: 5.0)));

  static const textButton = ButtonStyle(
      textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal)),
      foregroundColor: WidgetStatePropertyAll<Color>(colors.primaryColor));

  static const headlineMedium = TextStyle(
      color: colors.black,
      fontSize: 36,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.bold,
      height: 1.5);

  static const labelSmall = TextStyle(
      color: colors.black,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      height: 1.5);

  static const bodySmall = TextStyle(
      color: colors.gray10,
      fontSize: 14,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);


  static const titleLarge = TextStyle(
      color: colors.black,
      fontSize: 24,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);

  static const labelLarge = TextStyle(
      color: colors.black,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);

  static var inputDeco = InputDecorationTheme(
      hintStyle: const TextStyle(color: colors.gray5),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colors.gray3, width: 1),
          borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(style: BorderStyle.solid, color: colors.primaryColor),
      ));

  static var inputSearchDeco = InputDecorationTheme(
      filled: true,
      fillColor: colors.white3,
      hintStyle: const TextStyle(color: colors.gray50),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: colors.gray3, width: 1), borderRadius: BorderRadius.circular(28.0)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid, color: colors.primaryColor),borderRadius: BorderRadius.circular(28.0)));

  static var inputRoundDeco = InputDecorationTheme(
      filled: true,
      fillColor: colors.white,
      hintStyle: const TextStyle(color: colors.gray50),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: colors.gray3, width: 1), borderRadius: BorderRadius.circular(28.0)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid, color: colors.primaryColor),borderRadius: BorderRadius.circular(28.0)));


  static var bottomNavigation = const BottomNavigationBarThemeData(
    backgroundColor: colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 1,
  );
}
