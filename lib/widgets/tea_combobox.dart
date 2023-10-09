import 'package:flutter/material.dart';
import 'package:tea/utils/buttons.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';

class TEAComboBox extends StatefulWidget {
  final String? placeHolder;
  final List<String> options;
  final Function(String) onSelect;

  const TEAComboBox({
    super.key,
    this.placeHolder = '',
    required this.options,
    required this.onSelect,
  });

  @override
  State<TEAComboBox> createState() => _TEAComboBoxState();
}

class _TEAComboBoxState extends State<TEAComboBox> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.comboBox,
      onPressed: _showOptions,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _comboBoxWidgets(),
      ),
    );
  }

  List<Widget> _comboBoxWidgets() {
    return <Widget>[
      Expanded(
        child: Text(
          selectedValue.isEmpty ? widget.placeHolder! : selectedValue,
          style: TextStyles.input,
        ),
      ),
      const Icon(Icons.arrow_drop_down),
    ];
  }

  void _selectedOptionChanged(String option) {
    setState(() {
      selectedValue = option;
      widget.onSelect(option);
      Navigator.pop(context);
    });
  }

  void _showOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: modalPadding,
          clipBehavior: Clip.hardEdge,
          child: ListView.separated(
            itemBuilder: (context, index) => TextButton(
              style: ButtonStyles.list,
              onPressed: () => _selectedOptionChanged(widget.options[index]),
              child: Text(widget.options[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(height: mainSpacing),
            itemCount: widget.options.length,
          ),
        );
      },
    );
  }

/*
  TextButton(
              style: ButtonStyles.textPrimary,
              onPressed: () => _selectedOptionChanged(widget.options[index]),
              child: Text(
                widget.options[index],
                style: TextStyles.input,
                textAlign: TextAlign.center,
              ),
            ),
   */
}
