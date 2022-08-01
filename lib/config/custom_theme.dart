import 'package:flutter/material.dart';
import 'colors.dart';

// Color Theming
class CustomWidgetTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        fontFamily: 'ProximaNova',
        // Scaffold Theming
        scaffoldBackgroundColor: Colors.white,
        // Button Theming
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'ProximaNova'),
                elevation: 0,
                splashFactory: NoSplash.splashFactory,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))),

        // Color Theming
        colorScheme: const ColorScheme.light(
            primary: Palette.pebbleBlack, secondary: Palette.shadowGray),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Palette.pebbleBlack),
          button: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          bodyText2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palette.anchorGray),
          headline1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Palette.pebbleBlack),
          headline2: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              color: Palette.pebbleBlack),
          headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Palette.pebbleBlack),
          subtitle1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Palette.pebbleBlack),
          subtitle2: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Palette.anchorGray),
          caption: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Palette.pebbleBlack),
          headline6: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Palette.pebbleBlack),
        ));
  }
}
