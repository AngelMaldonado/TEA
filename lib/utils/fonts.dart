/// Archivo: fonts.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Constantes de fuentes para el tema de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';

const String appFontFamily = 'Montserrat';
const Color appTextColor = primaryLight;
const TextStyle h2 = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextStyle h3 = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextStyle inputText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextStyle buttonText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
  color: primaryLight,
);
const TextStyle buttonTextSecondary = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);
const TextStyle paragraphLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  height: 1,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextStyle paragraph = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  height: 1,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextStyle paragraphSmall = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  height: 1,
  color: primaryLight,
  shadows: <Shadow>[mainShadow],
);
const TextTheme appTextTheme = TextTheme(
  headlineMedium: h2,
  headlineSmall: h3,
  bodyLarge: paragraphLarge,
  bodyMedium: paragraph,
  bodySmall: paragraphSmall,
  labelLarge: buttonText,
  labelMedium: inputText,
);
