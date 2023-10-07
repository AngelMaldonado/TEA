import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_appbar.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_checkbox_group.dart';
import 'package:tea/widgets/tea_text.dart';

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
          padding: appPadding,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TEAText(
                widget.question,
                textStyle: TEATextStyle.inputText,
                color: primaryLight,
                shadows: false,
                alignment: TextAlign.center,
              ),
              Expanded(
                child: Lottie.asset(widget.animationJSONPath),
              ),
              TEACheckBoxGroup(
                options: widget.answer.options,
                onSelectedValueChanged: (_) {},
              ),
              TEAButton(
                action: widget.validateSelection
                    ? validateSelection
                    : widget.onNextAction,
                label: 'Siguiente',
                icon: Icons.arrow_forward,
                theme: TEAWidgetTheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
