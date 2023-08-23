/// Archivo: initial_data.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 31 de julio del 2023
/// Descripción: Pantalla de recaudación de información principal
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tea/models/initial_info.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/widgets/tea_text.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_checkbox_group.dart';
import 'package:tea/widgets/tea_combobox.dart';
import 'package:tea/widgets/tea_range_selector.dart';

import '../utils/constants.dart';
import '../widgets/tea_appbar.dart';

class InitialData extends StatefulWidget {
  final InitialInfo initialInfo;
  final Function onNextAction;
  final Function onBackAction;

  const InitialData({
    super.key,
    required this.initialInfo,
    required this.onNextAction,
    required this.onBackAction,
  });

  @override
  State<InitialData> createState() => _InitialDataState();
}

class _InitialDataState extends State<InitialData>
    with AutomaticKeepAliveClientMixin {
  final Map<String, bool> _sex = {'👦Masculino': false, '👧Femenino': false};

  void _validateForm() {
    if (widget.initialInfo.sex.isEmpty ||
        widget.initialInfo.municipality.isEmpty ||
        widget.initialInfo.cp.toString().length < 5) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.pop(context),
          );
          return const AlertDialog(
            content: Text(
              'Porfavor llene todos los campos antes de continuar',
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    } else {
      widget.onNextAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1,
        ),
        child: TEAAppBar(
          title: 'Datos Iniciales',
          action: widget.onBackAction,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: appPadding,
          children: <Widget>[
            Text(
              '👦 Edad',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '${widget.initialInfo.age} Meses',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: mainSpacing),
            TEARangeSelector(
              valueChanged: (newAge) => setState(
                () => widget.initialInfo.age = newAge.toInt(),
              ),
              value: widget.initialInfo.age.toDouble(),
              min: 18,
              max: 24,
              minLabel: Text(
                '18',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              maxLabel: Text(
                '24',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '♀️♂️ Sexo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TEACheckBoxGroup(
              options: _sex,
              onSelectedValueChanged: (String selectedSex) =>
                  widget.initialInfo.sex = selectedSex.substring(2),
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '📍 Municipio',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: mainSpacing),
            TEAComboBox(
              placeHolder: 'Elige un municipio',
              options: InitialInfo.municipalities,
              onSelect: (String selection) {
                widget.initialInfo.municipality = selection;
              },
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '🏷️ Código Postal',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: mainSpacing),
            TextField(
              maxLength: 5,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: inputTextDark,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: buttonPadding,
                filled: true,
                fillColor: primaryLight,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (String value) {
                widget.initialInfo.cp = int.parse(value);
              },
            ),
            const SizedBox(height: mainSpacing * 2),
            TEAButton(
              action: _validateForm,
              label: 'Siguiente',
              icon: Icons.arrow_forward,
              theme: TEAWidgetTheme.secondary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
