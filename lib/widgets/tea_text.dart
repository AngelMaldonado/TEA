/// Archivo: tea_text.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Constantes de fuentes para el tema de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/tea_theme.dart';

const String appFontFamily = 'Montserrat';

class TEAText extends StatelessWidget {
  final String? data;
  final TEATextStyle? textStyle;
  final TextAlign? alignment;
  final Color? color;
  final bool? shadows;

  const TEAText(
    this.data, {
    super.key,
    this.textStyle = TEATextStyle.p,
    this.alignment = TextAlign.start,
    this.color,
    this.shadows = true,
  });

  TextStyle? getStyle(TEATextStyle style) {
    TextStyle textStyle = textStyles[style]!;
    if (color != null) {
      textStyle = textStyle.copyWith(color: color);
    }
    if (shadows == false) {
      textStyle = textStyle.copyWith(shadows: []);
    }
    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      textAlign: alignment,
      style: getStyle(textStyle!),
    );
  }

  static Map<TEATextStyle, TextStyle> textStyles = {
    TEATextStyle.h2: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: primaryLight,
      shadows: const <Shadow>[titleShadow],
    ),
    TEATextStyle.h3: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: primaryLight,
      shadows: const <Shadow>[titleShadow],
    ),
    TEATextStyle.inputText: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      shadows: const <Shadow>[textShadow],
    ),
    TEATextStyle.p: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      height: 1.2,
      color: primaryLight,
      shadows: const <Shadow>[textShadow],
    ),
  };
}

const TextStyle inputText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
  color: primaryLight,
  shadows: <Shadow>[titleShadow],
);
const TextStyle inputTextDark = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
  color: Colors.black,
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
);
const TextStyle paragraphSmall = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  height: 1,
  color: primaryLight,
);
