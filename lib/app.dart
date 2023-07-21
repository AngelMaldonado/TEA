/// Archivo: app.dart
/// Autor: Angel de Jesús Maldonado Juárez
/// Fecha: 20 de julio del 2023
/// Descripción: Clase principal para ejecutar la App
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/screens/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TEA',
      home: Splash(),
    );
  }
}
