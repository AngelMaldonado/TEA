/// Archivo: app.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincon
/// Fecha: 20 de julio del 2023
/// Descripción: Clase principal para ejecutar la App con manejo de rutas
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea/provider.dart';
import 'package:tea/screens/splash.dart';
import 'package:tea/utils/theme.dart';
import 'package:tea/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ResultadoProvider>(
          create: (_) => ResultadoProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: 'TEA',
        theme: mainTheme,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const Splash(),
          'home': (context) => const Home(),
          'info': (context) => const Info(),
          'initial_data': (context) => const InitialData(),
          'pregunta_1': (context) => const Pregunta1(),
          'pregunta_2': (context) => const Pregunta2(),
          'pregunta_3': (context) => const Pregunta3(),
          'pregunta_4': (context) => const Pregunta4(),
          'pregunta_5': (context) => const Pregunta5(),
          'pregunta_6': (context) => const Pregunta6(),
          'resultadoNegativo': (context) => const ResultadoNegativo(),
          'resultadoPositivo': (context) => const ResultadoPositivo(),
          'respuestas': (context) => const Respuestas(),
          'info_pregunta_1': (context) => const InfoPregunta1(),
          'info_pregunta_2': (context) => const InfoPregunta2(),
          'info_pregunta_3': (context) => const InfoPregunta3(),
          'info_pregunta_4': (context) => const InfoPregunta4(),
          'info_pregunta_5': (context) => const InfoPregunta5(),
          'info_pregunta_6': (context) => const InfoPregunta6(),
        },
      ),
    );
  }
}
