/// Archivo: initial_data.dart
/// Autores: Angel de Jesús Maldonado Juárez
/// Fecha: 31 de julio del 2023
/// Descripción: Pantalla de recaudación de información principal
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/widgets/tea_range_selector.dart';
import '../utils/constants.dart';
import '../widgets/appbar.dart';

class InitialData extends StatefulWidget {
  const InitialData({super.key});

  @override
  State<InitialData> createState() => _InitialDataState();
}

class _InitialDataState extends State<InitialData> {
  int _age = 18;

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
              '$_age Meses',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: mainSpacing),
            TEARangeSelector(
              valueChanged: (newAge) => setState(() => _age = newAge.toInt()),
              value: _age.toDouble(),
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
          ],
        ),
      ),
    );
  }
}
