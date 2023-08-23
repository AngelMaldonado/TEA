import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_text.dart';

class TEAButton extends StatelessWidget {
  final Function action;
  final String? label;
  final IconData? icon;
  final TEAWidgetTheme? theme;

  const TEAButton({
    super.key,
    required this.action,
    this.label,
    this.icon,
    this.theme = TEAWidgetTheme.primary,
  });

  ButtonStyle _getButtonStyle() {
    ButtonStyle buttonStyle = theme == TEAWidgetTheme.secondary
        ? buttonStyles[TEAWidgetTheme.secondary]!
        : buttonStyles[TEAWidgetTheme.primary]!;
    if (label == null) {
      buttonStyle = buttonStyle.copyWith(
        shape: const MaterialStatePropertyAll(CircleBorder()),
      );
    }
    return buttonStyle;
  }

  List<Widget> _getButtonContent() {
    List<Widget> buttonContent = <Widget>[];
    if (label != null) {
      buttonContent.add(
        Text(label!, style: TEAText.textStyles[TEATextStyle.inputText]),
      );
    }
    if (icon != null) {
      buttonContent.add(Icon(icon));
    }
    return buttonContent;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _getButtonStyle(),
      onPressed: () => action(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getButtonContent(),
      ),
    );
  }

  static MaterialStateProperty<Color> _buttonForegroundColor(
    Color normal,
    Color pressed,
  ) {
    getForegroundColor(Set<MaterialState> states) =>
        states.contains(MaterialState.pressed) ? pressed : normal;

    return MaterialStateProperty.resolveWith(getForegroundColor);
  }

  static Map<TEAWidgetTheme, ButtonStyle> buttonStyles = {
    TEAWidgetTheme.primary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      backgroundColor: const MaterialStatePropertyAll(secondary),
      foregroundColor: _buttonForegroundColor(primaryLight, Colors.black),
      overlayColor: const MaterialStatePropertyAll(secondaryLight),
    ),
    TEAWidgetTheme.secondary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _buttonForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
  };
}
