import 'package:flutter/material.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_text.dart';
import '../utils/constants.dart';
import '../utils/tea_theme.dart';

class TEAAppBar extends StatelessWidget {
  final String title;
  final bool? centerTitle;
  final Function action;

  const TEAAppBar({
    super.key,
    required this.title,
    required this.action,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: appPadding.left,
          right: appPadding.right,
          top: appPadding.top,
        ),
        child: AppBar(
          toolbarHeight: double.infinity,
          clipBehavior: Clip.none,
          leading: Transform.translate(
            offset: const Offset(-10, 0),
            child: TEAButton(
              action: () => Navigator.pop(context),
              icon: Icons.arrow_back_ios_new,
              theme: TEAWidgetTheme.secondary,
            ),
          ),
          centerTitle: true,
          title: centerTitle == false
              ? const Align(
                  alignment: Alignment.center,
                  child: TEAText('TEA', textStyle: TEATextStyle.h2),
                )
              : const TEAText('TEA', textStyle: TEATextStyle.h2),
        ),
      ),
    );
  }
}
