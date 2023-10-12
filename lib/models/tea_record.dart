/// Archivo: tea_record.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
/// Fecha: 20 de julio del 2023
/// Descripción: Clase principal para gestionar los registros
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/models/initial_info.dart';

class TEARecord extends ChangeNotifier {
  // Atributos para almacenar información inicial, respuestas y resultado
  late InitialInfo initialInfo;
  late List<Answer> answers;
  late bool hasAutism;

  TEARecord() {
    // Inicializa la información inicial y las respuestas
    initialInfo = InitialInfo();
    answers = List.generate(
      Answer.questions.length,
      (index) => Answer(question: Answer.questions[index]),
    );
  }

  // Método para generar el resultado del diagnóstico
  void generateResult() {
    // Obtiene una lista de respuestas relacionadas con estadísticas (excepto la última pregunta)
    List<Answer> statsAnswers = answers.sublist(0, answers.length - 1);

    // Comprueba si alguna respuesta indica la presencia de autismo
    if (statsAnswers.any((answer) =>
        answer.options['Solo a veces'] == true ||
        answer.options['Muchas veces'] == true)) {
      hasAutism = true; // Indica que se sospecha autismo
    } else {
      hasAutism = false; // No se sospecha autismo
    }
  }

  // Método para obtener las respuestas en forma de lista de cadenas
  List<String> getAnswerStrings() {
    return answers.map((answer) => answer.getSelectedOption()).toList();
  }
}
