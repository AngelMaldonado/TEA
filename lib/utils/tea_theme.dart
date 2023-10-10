/// Archivo: tea_theme.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Tema principal de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';

enum TEAWidgetTheme { primary, secondary }

final ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
    elevation: 0,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: primaryLight,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: primaryLight,
    inactiveTickMarkColor: primaryLight,
    inactiveTrackColor: primaryLight,
    thumbColor: primaryLight,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 23),
    trackHeight: 8.0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      color: primaryLight,
      width: 2.5,
      strokeAlign: BorderSide.strokeAlignOutside,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    checkColor: const MaterialStatePropertyAll(primary),
    fillColor: const MaterialStatePropertyAll(primaryLight),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    horizontalTitleGap: 8,
  ),
);
