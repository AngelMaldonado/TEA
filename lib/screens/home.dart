/**
 * Universidad Autónoma de San Luis Potosí
 * Facultad de Ingeniería
 * home.dart
 * - Autores: Angel de Jesús Maldonado Juárez
 *            Carlos Andrés de la Rosa Rincon
 * - Creado el: 20 de julio del 2023
 * - Última modificación: ---
 * - Descripción: Pantalla (Widget) principal de la aplicación.
 */

/// Importación de bibliotecas
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tea/screens/info.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
import 'package:tea/widgets/tea_button.dart';

/// Widget Home
class Home extends StatelessWidget {
  // Constructor
  const Home({super.key});

  // Método "build" para construir la interfaz de la pantalla
  @override
  Widget build(BuildContext context) {
    // WillPopScope permite el comportamiento de confirmar que el usuario salga
    // de la App si ya retrocedió en las pantallas lo máximo posible
    return WillPopScope(
      // Alerta de que saldrá de la aplicación
      onWillPop: () => _showBackButtonWaring(context),
      // Scaffold es el cuerpo del App
      child: Scaffold(
        // SafeArea detecta la barra de notificaciones del dispositivo y
        // renderiza el contenido por debajo de esta
        body: SafeArea(
          // Padding agrega espacios del borde hacia dentro
          child: Padding(
            padding: appPadding,
            // Column permite agregar varios Widgets de forma vertical
            child: Column(
              // Arreglo de Widgets
              children: <Widget>[
                // Expande la columna para ocupar el 100% de altura del
                // dispositivo
                Expanded(
                  child: Column(
                    // Da un espaciado igual a todos los Widgets dentro de
                    // Column
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // _welcomeWidgets crea los Widgets hijos
                    children: _welcomeWidgets(context),
                  ),
                ),
                // Crea la barra para navegar
                _actionWidgets(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir widgets de bienvenida
  List<Widget> _welcomeWidgets(BuildContext context) {
    return <Widget>[
      Column(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/logo_family.svg',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          verticalSpacer,
          Text(welcome, textAlign: TextAlign.center, style: TextStyles.h2),
        ],
      ),
      Text(
        introduction,
        textAlign: TextAlign.center,
        style: TextStyles.p_shadowed,
      ),
    ];
  }

  // Método para construir widgets de acción
  Column _actionWidgets(BuildContext context) {
    return Column(
      children: <Widget>[
        TEAButton(
          label: 'TEA',
          action: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Info()),
          ),
        ),
        verticalSpacer,
        TEAButton(
          theme: TEAWidgetTheme.secondary,
          label: 'Comenzar',
          icon: Icons.arrow_forward,
          action: () => _showWarning(context),
        ),
      ],
    );
  }

  // Método para mostrar un cuadro de diálogo de advertencia
  void _showWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TEAAlertDialog(
        title: 'Advertencia',
        content: appPurpose,
        actions: <TEAButton>[
          TEAButton(
            theme: TEAWidgetTheme.secondary,
            label: 'Cancelar',
            action: () => Navigator.pop(context),
          ),
          TEAButton(
            label: 'Continuar',
            icon: Icons.arrow_forward,
            action: () => Navigator.pushNamed(context, 'questions'),
          ),
        ],
      ),
    );
  }

  // Método para mostrar un cuadro de diálogo de advertencia al presionar el botón de retroceso
  _showBackButtonWaring(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TEAAlertDialog(
        title: 'Saldrá de la App',
        content: '¿Está segur@ que desea salir de la App?',
        actions: <TEAButton>[
          TEAButton(
            theme: TEAWidgetTheme.secondary,
            label: 'Salir',
            action: () => SystemNavigator.pop(),
          ),
          TEAButton(
            label: 'Seguir en la App',
            action: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
