import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_text.dart';
import 'package:tea/guarda_datos.dart';
import 'package:tea/provider.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  final TEARecord teaRecord;
  bool resultadoDiagnostico = false;
  Results({super.key, required this.teaRecord});
  
  String _resultText() {
    String resultText;
    if (teaRecord.answers.any((answer) => answer.options['Siempre'] == true)) {
      resultText = 'Existe sospecha de TEA';
      resultadoDiagnostico = true;
    } else {
      resultText = 'No existe sospecha de TEA';
      resultadoDiagnostico = false;
    }
    return resultText;
  }

  List<Widget> _answersWidgets(BuildContext context) {
    List<Widget> answersWidgets = <Widget>[];
    List<String> respuestas = teaRecord.getAnswerStrings();
    final initialDataProvider = Provider.of<InitialDataProvider>(context);

  // Usar los valores actualizados
  guardaDatos(
    initialDataProvider.cp,
    initialDataProvider.edad,
    initialDataProvider.municipio,
    initialDataProvider.sexo,
    respuestas,
    resultadoDiagnostico,
  );
    for (int answer = 0; answer < teaRecord.answers.length; answer++) {
      answersWidgets.add(
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TEAText(
                  '${answer + 1}',
                  textStyle: TEATextStyle.h3,
                ),
                const SizedBox(width: 24),
                Flexible(child: TEAText(teaRecord.answers[answer].question)),
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
                  TEAText(
                    teaRecord.answers[answer].getSelectedOption(),
                    shadows: false,
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
            const TEAText(
              'Resultado',
              textStyle: TEATextStyle.h2,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TEAText(
              _resultText(),
              textStyle: TEATextStyle.h2,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Column(
              children: _answersWidgets(context),
            ),
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
        ),
      ),
    );
  }
}