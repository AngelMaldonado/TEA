import 'package:flutter/material.dart';
import 'package:tea/screens/home.dart';
import 'package:tea/utils/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  static const duration = Duration(seconds: 4);
  late AnimationController animationController;
  late Animation<double> animation;
  late Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 0.7, curve: Curves.easeInBack),
    );
    animationController.repeat(reverse: true);
    tween = Tween(begin: 0.1, end: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedOverflowBox(
        size: MediaQuery.of(context).size,
        child: Center(
          child: ScaleTransition(
            scale: tween.animate(animation),
            child: Container(
              width: MediaQuery.of(context).size.longestSide,
              height: MediaQuery.of(context).size.longestSide,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
              ),
            ),
          ),
        ),
      ),
      nextScreen: Home(),
      backgroundColor: primaryLight,
      splashIconSize: MediaQuery.of(context).size.height,
      pageTransitionType: PageTransitionType.topToBottom,
      duration: duration.inMilliseconds,
    );
  }
}
