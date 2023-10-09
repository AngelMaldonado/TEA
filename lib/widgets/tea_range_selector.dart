/// Archivo: tea_range_selector.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 1 de agosto del 2023
/// Descripción: Componente para elegir la edad del hijo del usuario
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/utils/fonts.dart';

class TEARangeSelector extends StatefulWidget {
  final Function(double) valueChanged;
  final double value;
  final double min;
  final double max;
  final bool showMinAndMaxLabels;

  const TEARangeSelector({
    super.key,
    required this.valueChanged,
    required this.value,
    required this.min,
    required this.max,
    this.showMinAndMaxLabels = true,
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
        Visibility(visible: widget.showMinAndMaxLabels, child: _labelsWidget()),
      ],
    );
  }

  Widget _labelsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Text>[
        Text(widget.min.round().toString(), style: TextStyles.h3),
        Text(widget.max.round().toString(), style: TextStyles.h3),
      ],
    );
  }
}
