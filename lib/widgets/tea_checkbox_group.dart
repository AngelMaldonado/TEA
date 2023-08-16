/// Archivo: tea_checkbox_group.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 2 de agosto del 2023
/// Descripción: Componente para agrupar múltiples checkbox
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/cupertino.dart';
import 'package:tea/widgets/tea_checkbox.dart';

class TEACheckBoxGroup extends StatefulWidget {
  final Map<String, bool> options;
  final Function(String) onSelectedValueChanged;

  const TEACheckBoxGroup({
    super.key,
    required this.options,
    required this.onSelectedValueChanged,
  });

  @override
  State<TEACheckBoxGroup> createState() => _TEACheckBoxGroupState();
}

class _TEACheckBoxGroupState extends State<TEACheckBoxGroup> {
  void toggleCheckBoxGroup(String checkBoxLabel) {
    setState(() {
      widget.options.forEach((label, selected) {
        if (selected && label != checkBoxLabel) {
          widget.options.update(label, (_) => false);
        } else if (label == checkBoxLabel) {
          widget.options.update(label, (_) => true);
        }
      });
    });
    widget.onSelectedValueChanged(checkBoxLabel);
  }

  List<Widget> generateCheckboxes() {
    List<TEACheckbox> checkboxes = <TEACheckbox>[];
    widget.options.forEach(
      (label, selected) => checkboxes.add(
        TEACheckbox(
          title: label,
          toggleAction: toggleCheckBoxGroup,
          value: selected,
        ),
      ),
    );
    return checkboxes;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: generateCheckboxes(),
    );
  }
}
