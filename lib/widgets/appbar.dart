import 'package:flutter/material.dart';
import 'package:tea/widgets/tea_button.dart';
import '../utils/constants.dart';
import '../utils/theme.dart';

class TEAAppBar extends StatelessWidget {
  final String title;
  final Function action;

  const TEAAppBar({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      leadingWidth: MediaQuery.of(context).size.height * 0.1,
      title: Text(title),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(appMargin / 2),
        child: TEAButton(
          action: () => action(),
          label: '',
          icon: Icons.arrow_back_ios_new,
          theme: TEAComponentTheme.secondary,
        ),
      ),
    );
  }
}
