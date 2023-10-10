import 'package:flutter/material.dart';
import 'package:tea/utils/buttons.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    if (label != null && icon != null) {
      return ElevatedButton(
        style: theme == TEAWidgetTheme.primary
            ? ButtonStyles.elevatedPrimary
            : ButtonStyles.elevatedSecondary,
        onPressed: () => action(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(label!, style: TextStyles.input), Icon(icon)],
        ),
      );
    } else if (label != null) {
      return TextButton(
        style: theme == TEAWidgetTheme.primary
            ? ButtonStyles.textPrimary
            : ButtonStyles.textSecondary,
        onPressed: () => action(),
        child: Text(label!, style: TextStyles.input),
      );
    } else if (icon != null) {
      return SizedBox(
        width: iconButtonSize,
        height: iconButtonSize,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: Icon(icon),
          onTap: () => action(),
        ),
      );
    } else {
      throw Exception('TEAButton requires label or icon');
    }
  }
}
