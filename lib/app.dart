/**
 * Universidad Autónoma de San Luis Potosí
 * Facultad de Ingeniería
 * app.dart
 * - Autores: Angel de Jesús Maldonado Juárez
 *            Carlos Andrés de la Rosa Rincon
 * - Creado el: 20 de julio del 2023
 * - Última modificación: ---
 * - Descripción: Widget principal de la aplicación, en este Widget se definen
 *   configuraciones de adaptabilidad como el escalado de la interfaz, unidades
 *   de medida, y las rutas por las cuales se navega en la aplicación.
 */

/// Importación de bibliotecas
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/screens/splash.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/routes.dart';

/// Widget principal de la aplicación.
/// * Manejo de rutas.
/// * Configuración de algunas opciones de adaptabilidad.
class App extends StatefulWidget {
  // Constructor (super.key es un identificador del Widget).
  const App({super.key});

  // Sobrecarga del método createState() para establecer el estado del
  // Widget App.
  @override
  State<App> createState() => _AppState();
}

/// Estado del Widget `App`
class _AppState extends State<App> {
  // Sobrecarga del método build() para renderizar el Widget.
  // Recibe context, que se refiere a la ubicación del Widget en el
  // widget tree de Flutter, esto permite que el Widget actual tenga
  // conocimiento de información como servicios, temas, estilos, e incluso
  // alguna información del dispositivo.
  // Retorna una instancia de la clase Widget.
  @override
  Widget build(BuildContext context) {
    // La dependencia ScreenUtil necesita instanciarse como el primer
    // Widget de la aplicación para poder especificar correctamente la
    // configuración de espaciados y escalados del texto y el resto de Widgets.
    return ScreenUtilInit(
      // Especificación del tamaño (en píxeles) que se usó en el diseño.
      designSize: const Size(393, 852),
      // Widget contenido por ScreenUtil.
      // MediaQuery permite acceder a las configuraciones del dispositivo.
      child: MediaQuery(
        // Del contexto actual se accede a la propiedad/configuración de
        // textScaleFactor que define que tan grande se muestran las fuentes
        // en el dispositivo.
        data: MediaQuery.of(context).copyWith(
          textScaleFactor:
              // Se establece que para la aplicación se fije un rango
              // permitido entre 1.0 y 1.06 (si se sobrepasan estos límites
              // algunos Widgets no se renderizan correctamente).
              MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.06),
        ),
        // Widget contenido por MediaQuery.
        // MaterialApp es el Widget que permite establecer las rutas de la
        // aplicación, así como la ruta inicial, el título, el tema, y otras
        // opciones para la inicialización de la aplicación.
        child: MaterialApp(
          // Título de la aplicación que aparecerá en la barra de la aplicación.
          title: 'TEA',
          // Desactiva el banner de depuración (se mostraría en la esquina).
          debugShowCheckedModeBanner: false,
          // Especificación del tema de la aplicación (utils/tea_theme.dart).
          theme: mainTheme,
          // Ruta inicial de la aplicación.
          initialRoute: 'splash',
          // Definición de las rutas de navegación de la aplicación.
          // Se define como un objeto JSON ({propiedad: valor}), de manera que
          // la propiedad es la cadena que indica la ruta a la cual se puede
          // acceder como "/ruta" y el valor es una función a la cual se le
          // pasa el context y retorna un Widget.
          // Estos Widgets se encuentran definidos en screens/.
          // Todas lass rutas deben ser exportadas para que puedan ser
          // instanciadas simplemente con llamar al constructor, estas
          // exportaciones se encuentran en routes.dart
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
