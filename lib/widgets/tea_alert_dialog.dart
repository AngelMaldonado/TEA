import 'package:flutter/material.dart';
import 'package:tea/widgets/tea_button.dart';

class TEAAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonLabel;
  final IconData? buttonIcon;
  final Function action;

  const TEAAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.action,
    required this.buttonLabel,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TEAButton(
          action: () {},
          label: buttonLabel,
          icon: buttonIcon,
        ),
      ],
    );
  }
}
