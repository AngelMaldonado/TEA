// TODO: Make IconButtonStyle

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';

enum buttonTheme {
  elevatedPrimary,
  elevatedSecondary,
  textPrimary,
  textSecondary,
  iconPrimary,
  iconSecondary,
  comboBox,
  list,
}

class ButtonStyles {
  static ButtonStyle get elevatedPrimary =>
      buttonStyles[buttonTheme.elevatedPrimary]!;

  static ButtonStyle get elevatedSecondary =>
      buttonStyles[buttonTheme.elevatedSecondary]!;

  static ButtonStyle get textPrimary => buttonStyles[buttonTheme.textPrimary]!;

  static ButtonStyle get textSecondary =>
      buttonStyles[buttonTheme.textSecondary]!;

  static ButtonStyle get iconPrimary => buttonStyles[buttonTheme.iconPrimary]!;

  static ButtonStyle get iconSecondary =>
      buttonStyles[buttonTheme.iconSecondary]!;

  static ButtonStyle get comboBox => buttonStyles[buttonTheme.comboBox]!;

  static ButtonStyle get list => buttonStyles[buttonTheme.list]!;

  static final Map<buttonTheme, ButtonStyle> buttonStyles = {
    buttonTheme.elevatedPrimary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      elevation: MaterialStatePropertyAll(mainElevation),
      backgroundColor: const MaterialStatePropertyAll(secondary),
      foregroundColor: _buttonForegroundColor(primaryLight, Colors.black),
      overlayColor: const MaterialStatePropertyAll(secondaryLight),
    ),
    buttonTheme.elevatedSecondary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      elevation: MaterialStatePropertyAll(mainElevation),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
    buttonTheme.textPrimary: ButtonStyle(
      minimumSize: const MaterialStatePropertyAll(
        Size(double.infinity, double.minPositive),
      ),
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      elevation: MaterialStatePropertyAll(mainElevation),
      backgroundColor: const MaterialStatePropertyAll(secondary),
      foregroundColor: _buttonForegroundColor(primaryLight, Colors.black),
      overlayColor: const MaterialStatePropertyAll(secondaryLight),
    ),
    buttonTheme.textSecondary: ButtonStyle(
      minimumSize: const MaterialStatePropertyAll(
        Size(double.infinity, double.minPositive),
      ),
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      elevation: MaterialStatePropertyAll(mainElevation),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
    buttonTheme.iconPrimary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      elevation: MaterialStatePropertyAll(mainElevation),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      //foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
    buttonTheme.iconSecondary: ButtonStyle(
      iconSize: MaterialStatePropertyAll(26.sp),
      padding: MaterialStatePropertyAll(buttonPadding),
      backgroundColor: const MaterialStatePropertyAll(secondary),
      foregroundColor: _buttonForegroundColor(primaryLight, Colors.black),
      overlayColor: const MaterialStatePropertyAll(secondaryLight),
    ),
    buttonTheme.comboBox: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusSemicircular),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
    buttonTheme.list: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: const MaterialStatePropertyAll(
        BeveledRectangleBorder(),
      ),
      textStyle: MaterialStatePropertyAll(TextStyles.input),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
  };

  static MaterialStateProperty<Color> _buttonForegroundColor(
    Color normal,
    Color pressed,
  ) {
    getForegroundColor(Set<MaterialState> states) =>
        states.contains(MaterialState.pressed) ? pressed : normal;
    return MaterialStateProperty.resolveWith(getForegroundColor);
  }
}
