/// Archivo: theme.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Tema principal de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';

MaterialStateProperty<Color> buttonForegroundColor(
    Color normal, Color pressed) {
  getForegroundColor(Set<MaterialState> states) {
    return states.contains(MaterialState.pressed) ? pressed : normal;
  }

  return MaterialStateProperty.resolveWith(getForegroundColor);
}

ButtonStyle primaryButtonTheme = ButtonStyle(
  padding: const MaterialStatePropertyAll(buttonPadding),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  ),
  backgroundColor: const MaterialStatePropertyAll(secondary),
  foregroundColor: buttonForegroundColor(Colors.white, Colors.black),
  overlayColor: const MaterialStatePropertyAll(secondaryLight),
);

ButtonStyle secondaryButtonTheme = ButtonStyle(
  padding: const MaterialStatePropertyAll(buttonPadding),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  ),
  backgroundColor: const MaterialStatePropertyAll(primaryLight),
  foregroundColor: buttonForegroundColor(Colors.black, Colors.white),
  overlayColor: const MaterialStatePropertyAll(primaryDark),
);

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: primary,
  textTheme: appTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: primary.withAlpha(200),
    elevation: 0,
    titleTextStyle: h2,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: primaryLight,
    titleTextStyle: paragraph.copyWith(
      color: Colors.red,
      shadows: [],
    ),
    contentTextStyle: paragraph.copyWith(
      color: Colors.black,
      shadows: [],
    ),
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: primaryLight,
    inactiveTickMarkColor: primaryLight,
    inactiveTrackColor: primaryLight,
    thumbColor: primaryLight,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 23),
    trackHeight: 8.0,
  ),
);
