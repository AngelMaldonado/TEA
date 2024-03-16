/// Archivo: info.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
/// Fecha: 20 de julio del 2023
/// Descripción: Representa la pantalla de información del TEA
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/widgets/tea_appbar.dart';
import '../utils/constants.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  // Método "build" para construir la interfaz de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicaciones personalizada
      appBar: TEAAppBar(
        action: () => Navigator.pop(context), // Botón para volver atrás
        title: 'TEA', // Título de la barra de aplicaciones
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: appPadding,
          itemBuilder: (BuildContext context, int index) => Text(
            info[index], // Muestra el texto de información
            style: index.isEven ? TextStyles.h3 : TextStyles.p, // Estilo de fuente según la posición
            textAlign: index.isEven ? TextAlign.center : TextAlign.start, // Alineación del texto
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 12), // Espacio entre elementos de la lista
          itemCount: info.length, // Cantidad de elementos en la lista
        ),
      ),
    );
  }
}
