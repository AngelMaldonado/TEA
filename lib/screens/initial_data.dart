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
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/theme.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:tea/widgets/tea_checkbox_group.dart';
import 'package:tea/widgets/tea_combobox.dart';
import 'package:tea/widgets/tea_range_selector.dart';
import '../utils/constants.dart';
import '../widgets/appbar.dart';

class InitialData extends StatefulWidget {
  const InitialData({super.key});

  @override
  State<InitialData> createState() => _InitialDataState();
}

class _InitialDataState extends State<InitialData> {
  final InitialInfo _initialInfo = InitialInfo(18, '', '', 0);
  final Map<String, bool> _sex = {'👦Masculino': false, '👧Femenino': false};
  final List<String> _municipalities = <String>[
    "Ahualulco",
    "Alaquines",
    "Aquismón",
    "Armadillo de los Infante",
    "Cárdenas",
    "Catorce",
    "Cedral",
    "Cerritos",
    "Cerro de San Pedro",
    "Charcas",
    "Ciudad del Maíz",
    "Ciudad Fernández",
    "Ciudad Valles",
    "Coxcatlán",
    "Ebano",
    "El Naranjo",
    "Guadalcázar",
    "Huehuetlán",
    "Lagunillas",
    "Matehuala",
    "Matlapa",
    "Mexquitic de Carmona",
    "Moctezuma",
    "Rayón",
    "Rioverde",
    "Salinas",
    "San Antonio",
    "San Ciro de Acosta",
    "San Luis Potosí",
    "San Martín Chalchicuautla",
    "San Nicolás Tolentino",
    "San Vicente Tancuayalab",
    "Santa Catarina",
    "Santa María del Río",
    "Santo Domingo",
    "Soledad de Graciano Sánchez",
    "Tamasopo",
    "Tamazunchale",
    "Tampacán",
    "Tampamolón Corona",
    "Tamuín",
    "Tancanhuitz",
    "Tanlajás",
    "Tanquián de Escobedo",
    "Tierra Nueva",
    "Vanegas",
    "Venado",
    "Villa de Arriaga",
    "Villa de Guadalupe",
    "Villa de la Paz",
    "Villa de Ramos",
    "Villa de Reyes",
    "Villa Hidalgo",
    "Villa Juárez",
    "Xilitla",
    "Zaragoza",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1,
        ),
        child: TEAAppBar(
          title: 'Datos Iniciales',
          action: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(appMargin),
          children: <Widget>[
            Text(
              '👦 Edad',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '${_initialInfo.age} Meses',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: mainSpacing),
            TEARangeSelector(
              valueChanged: (newAge) => setState(
                () => _initialInfo.age = newAge.toInt(),
              ),
              value: _initialInfo.age.toDouble(),
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
                  _initialInfo.sex = selectedSex.substring(2),
            ),
            const SizedBox(height: mainSpacing),
            Text(
              '📍 Municipio',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: mainSpacing),
            TEAComboBox(
              placeHolder: 'Elige un municipio',
              options: _municipalities,
              onSelect: (String selection) {
                _initialInfo.municipality = selection;
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
              onChanged: (String value) => _initialInfo.cp = int.parse(value),
            ),
            const SizedBox(height: mainSpacing * 2),
            TEAButton(
              action: () => Navigator.pushNamed(context, 'home'),
              label: 'Siguiente',
              icon: Icons.arrow_forward,
              theme: TEAComponentTheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
