/**
 * Universidad Autónoma de San Luis Potosí
 * Facultad de Ingeniería
 * main.dart
 * - Autores: Angel de Jesús Maldonado Juárez
 *            Carlos Andrés de la Rosa Rincon
 * - Creado el: 20 de julio del 2023
 * - Última modificación: ---
 * - Descripción: Punto de ejecución principal de la aplicación
 */

/// Importación de bibliotecas
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tea/app.dart';

/// Función main
void main() async {
  // Inicialización del componente WidgetsBinding del engine de Flutter,
  // debe existir la instancia creada para poder inicializar Firebase, ya que
  // Firebase requiere llamar código nativo.
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Firebase con las opciones y configuraciones de la
  // plataforma de ejecución (iOS o Android) que se encuentran en
  // firebase_options.dart, este archivo es autogenerado por la dependencia
  // de Firebase, por lo que se recomienda no modificarlo.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Instanciación del Widget principal App y puesta en marcha
  runApp(const App());
}
