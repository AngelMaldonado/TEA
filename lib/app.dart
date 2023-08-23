/// Archivo: app.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincon
/// Fecha: 20 de julio del 2023
/// Descripción: Clase principal para ejecutar la App con manejo de rutas
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tea/models/answer.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/provider.dart';
import 'package:tea/screens/splash.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData query = MediaQuery.of(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MediaQuery(
        data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(1.0, 1.06),
        ),
        child: MaterialApp(
          title: 'TEA',
          theme: TEATheme.mainTheme(),
          initialRoute: 'splash',
          routes: {
            'splash': (context) => const Splash(),
            'home': (context) => const Home(),
            'info': (context) => const Info(),
            'questions': (context) => const Questions(),
          },
        ),
      ),
    );
  }
}
