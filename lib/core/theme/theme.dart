import 'package:cwc_cryptic_crusade/core/theme/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appThemeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      primaryColor: AppPalette.whiteColor,
      textTheme: ThemeData.dark()
          .textTheme
          .apply(fontFamily: 'SpaceMono', fontFamilyFallback: ['SpaceMono']),
      inputDecorationTheme: InputDecorationTheme(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(48.0))),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 50),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 50),
          ),
        ),
      ));
}
