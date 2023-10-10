/// Archivo: constants.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 23 de julio del 2023
/// Descripción: Constantes de medición para espacios entre componentes
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Units constants
final double mainSpacing = 12.sp;
final double mainPadding = 24.sp;
final double mainPaddingVertical = 24.h;
final double mainPaddingHorizontal = 24.w;
final double mainElevation = 3.sp;
final double borderRadiusCircular = 100.sp;
final double borderRadiusSemicircular = 12.sp;
final double insetPadding = 32.sp;
final double iconButtonSize = 56.sp;
final double appBarHeight = 80.sp;

/// Spacers
final SizedBox verticalSpacer = SizedBox(height: mainSpacing);
final SizedBox horizontalSpacer = SizedBox(width: mainSpacing);

/// Edge insets
final EdgeInsets appPadding = EdgeInsets.symmetric(
  horizontal: mainPaddingHorizontal,
  vertical: mainPaddingVertical,
);
final EdgeInsets modalPadding = EdgeInsets.all(insetPadding);
final EdgeInsets buttonPadding = EdgeInsets.all(mainSpacing);
const EdgeInsets textButtonPadding = EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 8,
);

/// Button constants *
RoundedRectangleBorder buttonBorderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(borderRadiusCircular),
);

/// Input constants *
OutlineInputBorder inputWidgetBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(borderRadiusSemicircular),
);

/// Text legends *
const telHospitalNinoyMujer = '+52 (444) 205 2465';
const telPaisDeMaravillas = '+52 (444) 832 1000\r\nExt. 9341';
const telTemazcalli = '+52 (444) 812 6196';
const positiveResultMessage = 'Existe probabilidad de que su hijo tenga TEA';
const negativeResultMessage = 'No es probable de que su hijo tenga TEA';
const welcome = 'Bienvenido a TEA';
const finalMessage =
    'Recuerde que este resultado no constituye un diagnóstico, '
    'pero es importante que consulte con un profesional de la '
    'salud para una evaluación más precisa.';
const appPurpose = 'El propósito de esta aplicación es recopilar '
    'información sobre el espectro autista en los hijos de los usuarios '
    'y no constituye una prueba oficial de diagnóstico.';
const introduction = 'A continuación, se le realizarán seis preguntas para un '
    'acercamiento del espectro autista en su hijo.\nAntes de '
    'iniciar la encuesta, le sugerimos indagar más acerca del '
    'espectro autista pulsando el botón "TEA".';
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
