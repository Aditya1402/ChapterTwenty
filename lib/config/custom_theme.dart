import 'package:flutter/material.dart';
import 'colors.dart';

class CustomWidgetTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'ProximaNova',
      // Scaffold Theming
      scaffoldBackgroundColor: Colors.white,
      // Button Theming
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              splashFactory: NoSplash.splashFactory,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))),

      // Color Theming
      colorScheme: const ColorScheme.light(
          primary: Palette.pebbleBlack, secondary: Palette.shadowGray),
    );
  }
}

class CustomTextTheme {
  static ThemeData get lightTheme {
    return ThemeData(textTheme: TextTheme());
  }
}
