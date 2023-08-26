import 'package:flutter/material.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_text.dart';

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
      style: comboBoxStyles[TEAWidgetTheme.secondary],
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
                  child: TEAText(
                    widget.options[index],
                    textStyle: TEATextStyle.inputText,
                    alignment: TextAlign.center,
                    color: Colors.black,
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
            child: TEAText(
              selectedValue.isEmpty ? widget.placeHolder : selectedValue,
              textStyle: TEATextStyle.inputText,
              shadows: false,
              color: Colors.black,
            ),
          ),
          const Expanded(flex: 0, child: Icon(Icons.arrow_drop_down)),
        ],
      ),
    );
  }

  static MaterialStateProperty<Color> _comboBoxForegroundColor(
    Color normal,
    Color pressed,
  ) {
    getForegroundColor(Set<MaterialState> states) =>
        states.contains(MaterialState.pressed) ? pressed : normal;

    return MaterialStateProperty.resolveWith(getForegroundColor);
  }

  static Map<TEAWidgetTheme, ButtonStyle> comboBoxStyles = {
    TEAWidgetTheme.primary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(buttonBorderRadius),
      backgroundColor: const MaterialStatePropertyAll(secondary),
      foregroundColor: _comboBoxForegroundColor(primaryLight, Colors.black),
      overlayColor: const MaterialStatePropertyAll(secondaryLight),
    ),
    TEAWidgetTheme.secondary: ButtonStyle(
      padding: MaterialStatePropertyAll(buttonPadding),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(inputBorderRadius),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(primaryLight),
      foregroundColor: _comboBoxForegroundColor(Colors.black, primaryLight),
      overlayColor: const MaterialStatePropertyAll(primaryDark),
    ),
  };
}
