import 'package:flutter/material.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/widgets/tea_button.dart';
import '../utils/constants.dart';
import '../utils/tea_theme.dart';

class TEAAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
  final String title;
  final bool centerTitle;
  final Function action;

  const TEAAppBar({
    super.key,
    required this.title,
    required this.action,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: double.infinity,
      title: Row(
        mainAxisAlignment: centerTitle
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: _appBarWidgets(),
      ),
    );
  }

  List<Widget> _appBarWidgets() {
    return <Widget>[
      TEAButton(
        action: () => action(),
        icon: Icons.arrow_back_ios_new,
        theme: TEAWidgetTheme.secondary,
      ),
      Visibility(
        visible: centerTitle,
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: iconButtonSize),
            child: Text(
              title,
              style: TextStyles.h2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      Visibility(
        visible: centerTitle ? false : true,
        child: Text(title, style: TextStyles.h2),
      ),
    ];
  }
}
