import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tea/screens/info.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
import 'package:tea/widgets/tea_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appPadding,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _welcomeWidgets(context),
                ),
              ),
              _actionWidgets(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _welcomeWidgets(BuildContext context) {
    return <Widget>[
      Column(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/logo_family.svg',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          verticalSpacer,
          Text(welcome, textAlign: TextAlign.center, style: TextStyles.h2),
        ],
      ),
      Text(
        introduction,
        textAlign: TextAlign.center,
        style: TextStyles.p_shadowed,
      ),
    ];
  }

  Column _actionWidgets(BuildContext context) {
    return Column(
      children: <Widget>[
        TEAButton(
          label: 'TEA',
          action: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Info()),
          ),
        ),
        verticalSpacer,
        TEAButton(
          theme: TEAWidgetTheme.secondary,
          label: 'Comenzar',
          icon: Icons.arrow_forward,
          action: () => _showWarning(context),
        ),
      ],
    );
  }

  void _showWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TEAAlertDialog(
        title: 'Advertencia',
        content: appPurpose,
        actions: <TEAButton>[
          TEAButton(
            theme: TEAWidgetTheme.secondary,
            label: 'Cancelar',
            action: () => Navigator.pop(context),
          ),
          TEAButton(
            label: 'Continuar',
            icon: Icons.arrow_forward,
            action: () => Navigator.pushNamed(context, 'questions'),
          ),
        ],
      ),
    );
  }
}
