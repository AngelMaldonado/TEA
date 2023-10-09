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
  late final List<Widget> _pageViewWidgets;
  late final PageController _pageController;
  final Duration _pageTransitionDuration = const Duration(milliseconds: 500);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _teaRecord = TEARecord();
    _pageViewWidgets = _generatePageViewWidgets();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _previousPage(),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pageViewWidgets,
      ),
    );
  }

  List<Widget> _generatePageViewWidgets() {
    List<Widget> pageViewWidgets = <Widget>[
      InitialData(
        initialInfo: _teaRecord.initialInfo,
        onNextAction: _nextPage,
        onBackAction: () => Navigator.pushNamedAndRemoveUntil(
          context,
          'home',
          (route) => false,
        ),
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
        );
      }),
    );

    pageViewWidgets.add(
      Results(teaRecord: _teaRecord, onBackAction: _previousPage),
    );

    return pageViewWidgets;
  }

  _nextPage() {
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

  _previousPage() {
    setState(() {
      if (_currentPage == 0) {
        Navigator.pop(context);
      }
      _pageController.animateToPage(
        --_currentPage,
        duration: _pageTransitionDuration,
        curve: Curves.easeOut,
      );
    });
  }
}
