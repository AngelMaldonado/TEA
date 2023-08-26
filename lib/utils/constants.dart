/// Archivo: constants.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Constantes de medición para espacios entre componentes
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets appPadding = EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h);
EdgeInsets buttonPadding = EdgeInsets.symmetric(
  horizontal: 12.sp,
  vertical: 12.sp,
);
double inputBorderRadius = 12.h;
double mainSpacing = 12.sp;
RoundedRectangleBorder buttonBorderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(28.h),
);
OutlineInputBorder inputWidgetBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(inputBorderRadius),
);
const EdgeInsets textButtonPadding = EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 8,
);
