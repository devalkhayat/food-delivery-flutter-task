import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants.dart' as consts;
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'styles.dart';

ThemeData getAppTheme() => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      scaffoldBackgroundColor: colors.gray4,
      useMaterial3: true,
      fontFamily: consts.fontFamilyName,
      appBarTheme: const AppBarTheme(backgroundColor: colors.white),
      elevatedButtonTheme:
          const ElevatedButtonThemeData(style: Styles.elevatedButton),
      textButtonTheme: const TextButtonThemeData(style: Styles.textButton),
      inputDecorationTheme: Styles.inputDeco,
      dividerTheme: const DividerThemeData(color: colors.gray6),
      bottomNavigationBarTheme: Styles.bottomNavigation,
      highlightColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      textTheme: const TextTheme(
          headlineLarge: Styles.headlineLarge,
          headlineMedium: Styles.headlineMedium,
          headlineSmall: Styles.headlineSmall,
          labelSmall: Styles.labelSmall,
      bodySmall: Styles.bodySmall,
      titleLarge: Styles.titleLarge,
      labelLarge: Styles.labelLarge),
    );
