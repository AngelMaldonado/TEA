/// Archivo: app.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincon
/// Fecha: 20 de julio del 2023
/// Descripción: Clase principal para ejecutar la App con manejo de rutas
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor:
              MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.06),
        ),
        child: MaterialApp(
          title: 'TEA', // Título de la aplicación que aparecerá en la barra de la aplicación.
          debugShowCheckedModeBanner: false, // Desactiva el banner de depuración en modo de depuración.
          theme: mainTheme, // Configuración del tema de la aplicación.
          initialRoute: 'splash', // Ruta inicial de la aplicación.

          // Define las rutas de navegación de la aplicación.
          routes: {
            'splash': (context) => const Splash(), 
            'home': (context) => const Home(), 
            'info': (context) => const Info(), 
            'questions': (context) => const Questions(),
            'references': (context) => const References(), 
          },
        ),
      ),
    );
  }
}
