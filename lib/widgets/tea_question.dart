import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_appbar.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_checkbox_group.dart';

class TEAQuestion extends StatefulWidget {
  final Answer answer;
  final int totalQuestions;
  final int currentQuestion;
  final String question;
  final String animationJSONPath;
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
  });

  @override
  State<TEAQuestion> createState() => _TEAQuestionState();
}

class _TEAQuestionState extends State<TEAQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TEAAppBar(
        title: '${widget.currentQuestion}/${widget.totalQuestions}',
        action: widget.onBackAction,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: appPadding,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.question,
                style: TextStyles.input_light_shadowed,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Lottie.asset(widget.animationJSONPath),
              ),
              TEACheckBoxGroup(
                options: widget.answer.options,
                onSelectedValueChanged: (_) {},
              ),
              SizedBox(height: mainSpacing),
              TEAButton(
                action: validateSelection,
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

  void validateSelection() {
    if (widget.answer.options.values.contains(true)) {
      widget.onNextAction();
    }
  }
}
