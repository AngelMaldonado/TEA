/// Archivo: tea_range_selector.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 1 de agosto del 2023
/// Descripción: Componente para elegir la edad del hijo del usuario
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';

class TEARangeSelector extends StatefulWidget {
  final Function(double) valueChanged;
  final double value;
  final double min;
  final double max;
  final Text minLabel;
  final Text maxLabel;

  const TEARangeSelector({
    super.key,
    required this.valueChanged,
    required this.value,
    required this.min,
    required this.max,
    required this.minLabel,
    required this.maxLabel,
  });

  @override
  State<TEARangeSelector> createState() => _TEARangeSelectorState();
}

class _TEARangeSelectorState extends State<TEARangeSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          min: widget.min,
          max: widget.max,
          value: widget.value.toDouble(),
          onChanged: (newValue) => widget.valueChanged(newValue),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Text>[widget.minLabel, widget.maxLabel],
        ),
      ],
    );
  }
}
