/// Archivo: tea_theme.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Tema principal de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/widgets/tea_text.dart';

enum TEAWidgetTheme {
  primary,
  secondary,
}

enum TEATextStyle {
  h2,
  h3,
  inputText,
  p,
}

ButtonStyle primaryComboBoxTheme = ButtonStyle(
  padding: MaterialStatePropertyAll(buttonPadding),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  backgroundColor: const MaterialStatePropertyAll(primaryLight),
  overlayColor: const MaterialStatePropertyAll(primaryDark),
);

ButtonStyle listTextButtonTheme = const ButtonStyle(
  textStyle: MaterialStatePropertyAll(buttonText),
  padding: MaterialStatePropertyAll(textButtonPadding),
  shape: MaterialStatePropertyAll(
    BeveledRectangleBorder(),
  ),
  backgroundColor: MaterialStatePropertyAll(primaryLight),
  overlayColor: MaterialStatePropertyAll(primaryDark),
);

class TEATheme {
  static ThemeData mainTheme() {
    return ThemeData(
      scaffoldBackgroundColor: primary,
      appBarTheme: AppBarTheme(
        backgroundColor: primary.withAlpha(200),
        elevation: 0,
        //titleTextStyle: h2,
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
  }
}
