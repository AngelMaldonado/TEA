import 'package:flutter/material.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/models/initial_info.dart';

class TEARecord extends ChangeNotifier {
  late InitialInfo initialInfo;
  late List<Answer> answers;
  late bool hasAutism;

  TEARecord() {
    initialInfo = InitialInfo();
    answers = List.generate(
      Answer.questions.length,
      (index) => Answer(question: Answer.questions[index]),
    );
  }

  void generateResult() {
    List<Answer> statsAnswers = answers.sublist(0, answers.length - 1);
    if (statsAnswers.any((answer) =>
        answer.options['Solo a veces'] == true ||
        answer.options['Muchas veces'] == true)) {
      hasAutism = true;
    } else {
      hasAutism = false;
    }
  }

  List<String> getAnswerStrings() {
    return answers.map((answer) => answer.getSelectedOption()).toList();
  }
}
