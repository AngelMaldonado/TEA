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

ButtonStyle primaryButtonTheme = ButtonStyle(
  padding: const MaterialStatePropertyAll(buttonPadding),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  ),
  backgroundColor: const MaterialStatePropertyAll(secondary),
  overlayColor: const MaterialStatePropertyAll(secondaryLight),
);

ButtonStyle secondaryButtonTheme = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(primaryLight),
  overlayColor: MaterialStatePropertyAll(primary),
);

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: primary,
  textTheme: appTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonTheme),
);
