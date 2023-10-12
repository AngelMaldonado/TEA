/// Archivo: home.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
/// Fecha: 20 de julio del 2023
/// Descripción: Representa la pantalla principal de la aplicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tea/screens/info.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
import 'package:tea/widgets/tea_button.dart';


class Home extends StatelessWidget {
  // Constructor de la clase Home
  const Home({super.key});

  // Método "build" para construir la interfaz de la pantalla
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showBackButtonWaring(context),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: appPadding,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _welcomeWidgets(context),
                  ),
                ),
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
