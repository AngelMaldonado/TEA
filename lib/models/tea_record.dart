import 'package:flutter/material.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/models/initial_info.dart';

class TEARecord extends ChangeNotifier {
  late InitialInfo initialInfo;
  late List<Answer> answers;

  TEARecord() {
    initialInfo = InitialInfo();
    answers = List.generate(
      Answer.questions.length,
      (index) => Answer(question: Answer.questions[index]),
    );
  }

  void setAnswer(int index, Answer answer) {
    answers[index] = answer;
    notifyListeners();
  }

  List<String> getAnswerStrings() {
    return answers.map((answer) => answer.getSelectedOption()).toList();
  }
}
