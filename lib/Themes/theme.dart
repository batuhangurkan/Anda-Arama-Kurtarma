import 'package:flutter/material.dart';

class ThemeClass {

  Color lightPrimayColor = Colors.white;
  Color darkPrimaryColor = Colors.black;
  Color secondaryColor = Colors.red;
  Color accentColor = Colors.redAccent;

static ThemeData lightTheme =  ThemeData(
  primaryColor: ThemeData.light().scaffoldBackgroundColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: _themeClass.lightPrimayColor,
    secondary: _themeClass.secondaryColor
  ),
);
static ThemeData darkTheme = ThemeData(
  primaryColor: ThemeData.dark().scaffoldBackgroundColor,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: _themeClass.darkPrimaryColor,
  ),
);
}


ThemeClass _themeClass = ThemeClass();