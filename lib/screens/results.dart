import 'package:flutter/material.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/services/main_service.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_text.dart';

class Results extends StatelessWidget {
  final TEARecord teaRecord;

  const Results({super.key, required this.teaRecord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: saveTEARecord(teaRecord),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: appPadding,
                children: <Widget>[
                  const TEAText(
                    'Resultado',
                    textStyle: TEATextStyle.h2,
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TEAText(
                    teaRecord.hasAutism
                        ? 'Existe sospecha de TEA'
                        : 'No existe sospecha de TEA',
                    textStyle: TEATextStyle.h2,
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const TEAText(
                    'Recuerde que este resultado no constituye un diagnóstico, '
                    'pero es importante que consulte con un profesional de la '
                    'salud para una evaluación más precisa.',
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  TEAButton(
                    action: () {},
                    label: 'Especialistas',
                    theme: TEAWidgetTheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  TEAButton(
                    action: () => Navigator.pushNamed(context, 'splash'),
                    label: 'Volver al inicio',
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
