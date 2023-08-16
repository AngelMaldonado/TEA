/// Archivo: tea_checkbox.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 2 de agosto del 2023
/// Descripción: Componente para elegir una opción dentro de un formulario
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';

class TEACheckbox extends StatelessWidget {
  final String title;
  final Function toggleAction;
  final bool value;

  const TEACheckbox({
    super.key,
    required this.title,
    required this.toggleAction,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      value: value,
      onChanged: (_) => toggleAction(title),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
