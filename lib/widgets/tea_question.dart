import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/theme.dart';
import 'package:tea/widgets/appbar.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_checkbox_group.dart';

class TEAQuestion extends StatefulWidget {
  final Answer answer;
  final int totalQuestions;
  final int currentQuestion;
  final String question;
  final String animationJSONPath;
  final bool validateSelection;
  final Function onNextAction;
  final Function onBackAction;

  const TEAQuestion({
    super.key,
    required this.answer,
    required this.totalQuestions,
    required this.currentQuestion,
    required this.question,
    required this.animationJSONPath,
    required this.onNextAction,
    required this.onBackAction,
    required this.validateSelection,
  });

  @override
  State<TEAQuestion> createState() => _TEAQuestionState();
}

class _TEAQuestionState extends State<TEAQuestion> {
  void validateSelection() {
    if (widget.answer.options.values.contains(true)) {
      widget.onNextAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1,
        ),
        child: TEAAppBar(
          title: '${widget.currentQuestion}/${widget.totalQuestions}',
          action: widget.onBackAction,
          centerTitle: false,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(appMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.question,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  shadows: [], // <- Eliminar del tema principal de bodyMedium
                ),
              ),
              Expanded(
                flex: 1,
                child: Lottie.asset(widget.animationJSONPath),
              ),
              const SizedBox(height: mainSpacing * 2),
              TEACheckBoxGroup(
                options: widget.answer.options,
                onSelectedValueChanged: (_) {},
              ),
              const SizedBox(height: mainSpacing * 2),
              TEAButton(
                action: widget.validateSelection
                    ? validateSelection
                    : widget.onNextAction,
                label: 'Siguiente',
                icon: Icons.arrow_forward,
                theme: TEAComponentTheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
