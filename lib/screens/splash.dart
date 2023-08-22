/// Archivo: app.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincon
/// Fecha: 20 de julio del 2023
/// Descripción: Pantalla de bienvenida (splash) con animación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  static const Duration duration = Duration(seconds: 4);
  late double overflowSize;
  late AnimationController iconAnimationController;
  late Animation<double> iconBackgroundAnimation;
  late Animation<double> iconAnimation;
  late Tween<double> iconBackgroundTween;
  late Tween<double> iconTween;

  @override
  void initState() {
    super.initState();
    iconAnimationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    iconBackgroundAnimation = CurvedAnimation(
      parent: iconAnimationController,
      curve: const Interval(0.85, 1.0, curve: Curves.easeInBack),
    );
    iconAnimation = CurvedAnimation(
      parent: iconAnimationController,
      curve: const Interval(0.85, 0.95, curve: Curves.linear),
    );
    iconAnimationController.forward();
    iconBackgroundTween = Tween(begin: 0.15, end: 1.0);
    iconTween = Tween(begin: 1.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    overflowSize = MediaQuery.of(context).size.longestSide * 1.5;
    return AnimatedSplashScreen(
      splash: OverflowBox(
        maxWidth: overflowSize,
        maxHeight: overflowSize,
        child: Center(
          child: ScaleTransition(
            scale: iconBackgroundTween.animate(iconBackgroundAnimation),
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.5),
              width: overflowSize,
              height: overflowSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
              ),
              child: FadeTransition(
                opacity: iconTween.animate(iconAnimation),
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
      nextScreen: const Home(),
      backgroundColor: primaryLight,
      splashIconSize: MediaQuery.of(context).size.height,
      pageTransitionType: PageTransitionType.topToBottom,
      duration: duration.inMilliseconds,
    );
  }
}
