/// Archivo: colors.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 21 de julio del 2023
/// Descripción: Constantes de color para el tema de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(70, 156, 191, 1.0);
const Color primaryDark = Color.fromRGBO(60, 132, 171, 1.0);
const Color primaryLight = Color.fromRGBO(222, 252, 249, 1.0);
const Color secondary = Color.fromRGBO(50, 132, 255, 1.0);
const Color secondaryLight = Color.fromRGBO(138, 185, 255, 1.0);
const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.25);
const Shadow titleShadow = Shadow(
  color: shadowColor,
  offset: Offset(0.0, 4.0),
  blurRadius: 4,
);
const Shadow textShadow = Shadow(
  color: shadowColor,
  offset: Offset(0.0, 2.0),
  blurRadius: 2,
);
