import 'package:flutter/material.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/services/main_service.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';

import '../widgets/tea_appbar.dart';

class Results extends StatelessWidget {
  final TEARecord teaRecord;
  final Function onBackAction;

  const Results({
    super.key,
    required this.teaRecord,
    required this.onBackAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1,
        ),
        child: TEAAppBar(
          title: 'Resultado',
          action: onBackAction,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: saveTEARecord(teaRecord),
          builder: (context, _) {
            return Padding(
              padding: appPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    teaRecord.hasAutism
                        ? 'Existe sospecha de TEA'
                        : 'No existe sospecha de TEA',
                    style: TextStyles.h2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Recuerde que este resultado no constituye un diagnóstico, '
                    'pero es importante que consulte con un profesional de la '
                    'salud para una evaluación más precisa.',
                    style: TextStyles.p_shadowed,
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: <Widget>[
                      TEAButton(
                        action: () =>
                            Navigator.pushNamed(context, 'references'),
                        label: 'Referencias',
                        theme: TEAWidgetTheme.secondary,
                      ),
                      SizedBox(height: mainSpacing),
                      TEAButton(
                        action: () => Navigator.pushNamed(context, 'splash'),
                        label: 'Volver al inicio',
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
