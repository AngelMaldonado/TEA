import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';

class Results extends StatelessWidget {
  final TEARecord teaRecord;

  const Results({super.key, required this.teaRecord});

  String _resultText() {
    String resultText;
    if (teaRecord.answers.any((answer) => answer.options['Siempre'] == true)) {
      resultText = 'Existe sospecha de TEA';
    } else {
      resultText = 'No existe sospecha de TEA';
    }
    return resultText;
  }

  List<Widget> _answersWidgets(BuildContext context) {
    List<Widget> answersWidgets = <Widget>[];
    for (int answer = 0; answer < teaRecord.answers.length; answer++) {
      answersWidgets.add(
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${answer + 1}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 24),
                Flexible(child: Text(teaRecord.answers[answer].question)),
              ],
            ),
            const SizedBox(height: 12),
            Chip(
              backgroundColor: primaryDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/answer_icon.svg'),
                  const SizedBox(width: 14),
                  Text(
                    teaRecord.answers[answer].getSelectedOption(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      );
    }
    return answersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: appPadding,
          children: <Widget>[
            Text(
              'Resultado',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              _resultText(),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Column(
              children: _answersWidgets(context),
            ),
            Text(
              'Recuerde que este resultado no constituye un diagnóstico, '
              'pero es importante que consulte con un profesional de la '
              'salud para una evaluación más precisa.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
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
        ),
      ),
    );
  }
}
