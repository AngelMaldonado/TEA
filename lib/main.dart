import 'package:flutter/material.dart';
import 'package:tea/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      initialRoute: 'home_page',
      routes:{
        'home_page':(context) => const HomePage(),

        'pregunta_1':(context) => const Pregunta1(),
        'pregunta_2':(context) => const Pregunta2(),
        'pregunta_3':(context) => const Pregunta3(),
        'pregunta_4':(context) => const Pregunta4(),
        'pregunta_5':(context) => const Pregunta5(),
        'pregunta_6':(context) => const Pregunta6(),

        'resultadoNegativo':(context) => const ResultadoNegativo(),
        'resultadoPositivo':(context) => const ResultadoPositivo(),
        
        'respuestas':(context) => const Respuestas(),

        'info_pregunta_1':(context) => const InfoPregunta1(),
        'info_pregunta_2':(context) => const InfoPregunta2(),
        'info_pregunta_3':(context) => const InfoPregunta3(),
        'info_pregunta_4':(context) => const InfoPregunta4(),
        'info_pregunta_5':(context) => const InfoPregunta5(),
        'info_pregunta_6':(context) => const InfoPregunta6(),
      },
    );
  }
}