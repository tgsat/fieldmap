import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.bgLight,
    drawerTheme: const DrawerThemeData(
      shape: BorderDirectional(
        top: BorderSide.none,
        start: BorderSide.none,
        end: BorderSide.none,
        bottom: BorderSide.none,
      ),
      backgroundColor: AppColor.bgSecondayLight,
      surfaceTintColor: AppColor.bgSecondayLight,
    ),
    primaryColor: AppColor.primary,
    iconTheme: const IconThemeData(color: AppColor.primary),
    dividerColor: AppColor.highlightLight,
    dividerTheme: const DividerThemeData(
      thickness: 1,
      color: AppColor.highlightLight,
    ),
    textTheme: TextThemes.textTheme,
    elevatedButtonTheme: ElevatedButtonThemes.elevatedButtonTheme,
    outlinedButtonTheme: OutlinedButtonThemes.outlinedButtonTheme,
    inputDecorationTheme: TextFormFieldThemes.inputDecorationTheme,
    expansionTileTheme:
        const ExpansionTileThemeData(shape: RoundedRectangleBorder()),
    badgeTheme:
        const BadgeThemeData(backgroundColor: AppColor.error, smallSize: 8),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
  );
}
