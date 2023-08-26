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
              action: () => action(),
              icon: Icons.arrow_back_ios_new,
              theme: TEAWidgetTheme.secondary,
            ),
          ),
          centerTitle: centerTitle,
          title: centerTitle == false
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TEAText(title, textStyle: TEATextStyle.h2),
                )
              : TEAText(title, textStyle: TEATextStyle.h2),
        ),
      ),
    );
  }
}
