import 'package:flutter/material.dart';
import 'package:tea/utils/theme.dart';

class TEAButton extends StatelessWidget {
  final Function action;
  final String label;
  final IconData? icon;
  final TEAComponentTheme? theme;

  const TEAButton({
    super.key,
    required this.action,
    required this.label,
    this.icon,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final Text buttonLabel = Text(label);
    final Icon buttonIcon = Icon(icon);
    List<Widget> buttonContent = icon != null
        ? <Widget>[buttonLabel, buttonIcon]
        : <Widget>[buttonLabel];
    final ButtonStyle buttonStyle = theme == TEAComponentTheme.secondary
        ? secondaryButtonTheme
        : primaryButtonTheme;
    return ElevatedButton(
      style: buttonStyle,
      onPressed: () => action(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttonContent,
      ),
    );
  }
}
