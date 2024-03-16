// Universidad Autónoma de San Luis Potosí
// Facultad de Ingeniería
// tea_theme.dart
// - Autores: Angel de Jesús Maldonado Juárez
//            Carlos Andrés de la Rosa Rincon
// - Creado el: 23 de julio del 2023
// - Última modificación: ---
// - Descripción: Definición del tema principal de la aplicación, en la
//   instanciación de `ThemeData()` se encuentran varias modificaciones de
//   algunos Widgets que Flutter tiene por defecto, de manera que sean lo más
//   fieles al diseño establecido. Las constantes del diseño como colores,
//   fuentes, espaciados, etc, se encuentran en los archivos de `utils/`.

// Importación de librerías
import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';

/// Tema que se utiliza en los Widgets de la aplicación, pueden ser
/// `primary` o `secondary`.
enum TEAWidgetTheme { primary, secondary }

/// Constante que tiene todas las modificaciones de colores, formas, y tamaños
/// de algunos Widgets de Flutter.
final ThemeData mainTheme = ThemeData(
  // Fondo de la aplicación
  scaffoldBackgroundColor: primary,
  // Modificación de la barra superior.
  appBarTheme: const AppBarTheme(
    backgroundColor: primary,
    elevation: 0,
  ),
  // Modificación de las ventanas modales.
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: primaryLight,
  ),
  // Modificación del slider para la edad:
  // https://api.flutter.dev/flutter/material/SliderThemeData-class.html
  sliderTheme: const SliderThemeData(
    activeTrackColor: primaryLight,
    inactiveTickMarkColor: primaryLight,
    inactiveTrackColor: primaryLight,
    thumbColor: primaryLight,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 23),
    trackHeight: 8.0,
  ),
  // Modificación de la decoración de los campos:
  // https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
  ),
  // Modificación del campo checkbox:
  // https://api.flutter.dev/flutter/material/CheckboxThemeData-class.html
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
  // Modificación de las tarjetas de contacto
  // https://api.flutter.dev/flutter/material/ListTileTheme-class.html
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    horizontalTitleGap: 8,
  ),
);
