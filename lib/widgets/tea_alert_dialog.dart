import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_text.dart';

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
      titlePadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      title: TEAText(
        title,
        textStyle: TEATextStyle.p,
        alignment: TextAlign.center,
        color: Colors.red,
        shadows: false,
      ),
      content: TEAText(
        content,
        textStyle: TEATextStyle.p,
        alignment: TextAlign.center,
        color: Colors.black,
        shadows: false,
      ),
      actions: <Widget>[
        TEAButton(
          action: () => action(),
          label: buttonLabel,
          icon: buttonIcon,
        ),
      ],
    );
  }
}
