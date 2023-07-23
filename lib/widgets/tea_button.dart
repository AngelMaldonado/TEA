import 'package:flutter/material.dart';
import 'package:tea/utils/theme.dart';

enum TEAButtonTheme {
  primary,
  secondary,
}

class TEAButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final TEAButtonTheme? theme;
  final IconData? icon;

  const TEAButton({
    super.key,
    required this.onTap,
    required this.label,
    this.icon,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttonContent = icon != null
        ? <Widget>[
            Text(label),
            Icon(icon, color: Colors.black),
          ]
        : <Widget>[Text(label)];
    return ElevatedButton(
      style: secondaryButtonTheme,
      onPressed: onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttonContent,
      ),
    );
  }
}
