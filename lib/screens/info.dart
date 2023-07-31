import 'package:flutter/material.dart';
import 'package:tea/widgets/appbar.dart';
import '../utils/constants.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> info = <String>[
      '¿Qué es?',
      'El Transtorno del Espectro Autista (TEA) es una condición del '
          'neurodesarrollo que afecta la forma en que una persona se comunica, '
          'interactúa socialmente y procesa la información. Se caracteriza por '
          'una amplia variedad de síntomas y niveles de gravedad, lo que da '
          'lugar al término "espectro". Algunas personas en el espectro '
          'autista pueden tener dificultades para comunicarse verbalmente y '
          'pueden mostrar patrones de comportamiento repetitivos, mientras que '
          'otras pueden tener habilidades de comunicación más desarrolladas y '
          'enfrentar desafíos en áreas sociales.',
      '¿Cuándo aparece?',
      'Los síntomas aparecen de forma variable a partir de los 18 meses y se '
          'consolidan a los 36 meses de edad.',
      '¿Qué lo causa?',
      'Existen múltiples causas por las cuales una persona puede ser '
          'diagnosticada con TEA. Frecuentemente, los pacientes tienen '
          'antecedentes familiares de transtornos de desarrollo o historial de '
          'riesgo neurológico perinatal (periodo inmediato anterior o '
          'posterior al nacimiento) y epilepsia. Sin embargo, existe la '
          'posibilidad de que la persona adquiera el transtorno por '
          'interacciones con su entorno que alteren su genética. Aunque '
          'también, una persona que tenga la mutación genética es probable que '
          'no desarrolle el transtorno.',
      '¿Cómo se trata?',
      'Para tratar el TEA, por lo general, se escoge un síntoma y se busca '
          'modificar tal conducta utilizando estrategias psicologicas y/o '
          'fármacos, aunque estos últimos son impredecibles y pueden o no '
          'tener el resultado esperado. ',
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1,
        ),
        child: TEAAppBar(
          title: 'TEA',
          action: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(appMargin),
          itemBuilder: (BuildContext context, int index) => Text(
            info.elementAt(index),
            style: index.isEven
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.bodyMedium,
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 12),
          itemCount: info.length,
        ),
      ),
    );
  }
}
