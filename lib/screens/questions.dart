import 'package:flutter/material.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/routes.dart';
import 'package:tea/widgets/tea_question.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late final TEARecord _teaRecord;
  late List<Widget> _pageViewWidgets;
  late final PageController _pageController;
  int _currentPage = 0;
  final Duration _pageTransitionDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _teaRecord = TEARecord();
    _pageViewWidgets = _generatePageViewWidgets();
    _pageController = PageController(initialPage: _currentPage);
  }

  List<Widget> _generatePageViewWidgets() {
    List<Widget> pageViewWidgets = <Widget>[
      InitialData(
        initialInfo: _teaRecord.initialInfo,
        onNextAction: _nextPage,
        onBackAction: () => Navigator.pop(context),
      ),
    ];

    pageViewWidgets.addAll(
      List.generate(_teaRecord.answers.length, (index) {
        return TEAQuestion(
          answer: _teaRecord.answers[index],
          totalQuestions: _teaRecord.answers.length,
          currentQuestion: index + 1,
          question: _teaRecord.answers[index].question,
          animationJSONPath: 'assets/animations/animation_q${index + 1}.json',
          onNextAction: _nextPage,
          onBackAction: _previousPage,
          validateSelection: true,
        );
      }),
    );

    pageViewWidgets.add(
      Results(teaRecord: _teaRecord, onBackAction: _previousPage),
    );

    return pageViewWidgets;
  }

  void _nextPage() {
    setState(() {
      if (_currentPage == _teaRecord.answers.length) {
        _teaRecord.generateResult();
      }
      _pageController.animateToPage(
        ++_currentPage,
        duration: _pageTransitionDuration,
        curve: Curves.easeOut,
      );
    });
  }

  void _previousPage() {
    setState(() {
      _pageController.animateToPage(
        --_currentPage,
        duration: _pageTransitionDuration,
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: _pageViewWidgets,
    );
  }
}
