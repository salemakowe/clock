import "package:flutter/material.dart";
import 'colors.dart';

class Themes {
  static final lightMode = ThemeData.light().copyWith(
    backgroundColor: LightModeKolors.backgroundColor,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: LightModeKolors.buttonColor,
    ),
  );

  static final darkMode = ThemeData.dark().copyWith(
    backgroundColor: DarkModeKolors.backgroundColor,
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: DarkModeKolors.buttonColor,
    ),
  );
}
