/// Archivo: main.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincon
/// Fecha: 20 de julio del 2023
/// Descripción: Clase que inicializa la aplicación y la ejecuta
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';

import 'package:tea/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con las opciones predeterminadas para la plataforma actual.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ejecuta la aplicación principal de Flutter.
  runApp(const App());
}
