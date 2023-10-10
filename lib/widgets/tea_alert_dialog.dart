import 'package:flutter/material.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/widgets/tea_button.dart';

class TEAAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<TEAButton>? actions;

  const TEAAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: modalPadding,
      titlePadding: appPadding,
      contentPadding: appPadding,
      actionsPadding: appPadding,
      actionsOverflowButtonSpacing: mainSpacing,
      title: Text(
        title,
        style: TextStyles.modal_title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: TextStyles.p_black,
        textAlign: TextAlign.center,
      ),
      actions: actions,
    );
  }
}
