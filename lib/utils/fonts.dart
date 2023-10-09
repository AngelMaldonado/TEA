import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/utils/colors.dart';

enum textStyle {
  h2,
  h3,
  p,
  p_black,
  p_shadowed,
  modal_title,
  input,
  input_shadowed,
  input_light_shadowed,
}

class TextStyles {
  static TextStyle get h2 => textStyles[textStyle.h2]!;

  static TextStyle get h3 => textStyles[textStyle.h3]!;

  static TextStyle get p => textStyles[textStyle.p]!;

  static TextStyle get p_black => textStyles[textStyle.p_black]!;

  static TextStyle get p_shadowed => textStyles[textStyle.p_shadowed]!;

  static TextStyle get modal_title => textStyles[textStyle.modal_title]!;

  static TextStyle get input => textStyles[textStyle.input]!;

  static TextStyle get input_light_shadowed =>
      textStyles[textStyle.input_light_shadowed]!;

  static final Map<textStyle, TextStyle> textStyles = {
    textStyle.h2: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: primaryLight,
      shadows: const <Shadow>[titleShadow],
    ),
    textStyle.h3: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: primaryLight,
      shadows: const <Shadow>[titleShadow],
    ),
    textStyle.p: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      height: 1.2,
      color: primaryLight,
    ),
    textStyle.p_black: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      height: 1.2,
      color: Colors.black,
    ),
    textStyle.p_shadowed: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      height: 1.2,
      color: primaryLight,
      shadows: const <Shadow>[textShadow],
    ),
    textStyle.modal_title: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    ),
    textStyle.input: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
    ),
    textStyle.input_light_shadowed: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      color: primaryLight,
      shadows: const <Shadow>[textShadow],
    ),
    textStyle.input_shadowed: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      shadows: const <Shadow>[textShadow],
    ),
  };
}
