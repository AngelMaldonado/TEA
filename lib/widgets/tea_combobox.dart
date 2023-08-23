import 'package:flutter/material.dart';
import 'package:tea/utils/tea_theme.dart';

class TEAComboBox extends StatefulWidget {
  final String placeHolder;
  final List<String> options;
  final Function(String) onSelect;

  const TEAComboBox({
    super.key,
    required this.placeHolder,
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
    void optionSelected(String option) {
      setState(() {
        selectedValue = option;
        widget.onSelect(option);
        Navigator.pop(context);
      });
    }

    return ElevatedButton(
      style: primaryComboBoxTheme,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              clipBehavior: Clip.hardEdge,
              child: ListView.separated(
                itemBuilder: (context, index) => TextButton(
                  style: listTextButtonTheme,
                  onPressed: () => optionSelected(widget.options[index]),
                  child: Text(
                    widget.options[index],
                    textAlign: TextAlign.center,
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: widget.options.length,
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              selectedValue.isEmpty ? widget.placeHolder : selectedValue,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Expanded(flex: 0, child: Icon(Icons.arrow_drop_down)),
        ],
      ),
    );
  }
}
