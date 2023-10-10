import 'package:flutter/material.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/widgets/tea_appbar.dart';
import '../utils/constants.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TEAAppBar(
        action: () => Navigator.pop(context),
        title: 'TEA',
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: appPadding,
          itemBuilder: (BuildContext context, int index) => Text(
            info[index],
            style: index.isEven ? TextStyles.h3 : TextStyles.p,
            textAlign: index.isEven ? TextAlign.center : TextAlign.start,
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 12),
          itemCount: info.length,
        ),
      ),
    );
  }
}
