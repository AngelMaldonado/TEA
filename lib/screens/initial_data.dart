/// Archivo: initial_data.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa
/// Fecha: 31 de julio del 2023
/// Descripción: Pantalla de recaudación de información principal
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/models/initial_info.dart';
import 'package:tea/models/location.dart';
import 'package:tea/utils/colors.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/utils/tea_theme.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
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

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TEAAppBar(title: 'Datos Iniciales', action: widget.onBackAction),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: appPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _formWidgets(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _formWidgets() {
    return <Widget>[
      Text('🔢 Edad', style: TextStyles.h2),
      verticalSpacer,
      Text(
        '${widget.initialInfo.age} Meses',
        style: TextStyles.h3,
        textAlign: TextAlign.center,
      ),
      verticalSpacer,
      TEARangeSelector(
        valueChanged: (newAge) => setState(
          () => widget.initialInfo.age = newAge.toInt(),
        ),
        value: widget.initialInfo.age.toDouble(),
        min: 18,
        max: 24,
      ),
      verticalSpacer,
      Text('♀️♂️ Sexo', style: TextStyles.h2),
      verticalSpacer,
      TEACheckBoxGroup(
        options: _sex,
        onSelectedValueChanged: (String selectedSex) {
          widget.initialInfo.sex = selectedSex.substring(2);
        },
      ),
      verticalSpacer,
      Text('📍 Estado', style: TextStyles.h2),
      verticalSpacer,
      TEAComboBox(
        options: Location.states,
        onSelect: (String selection) {
          setState(() => widget.initialInfo.location.state = selection);
        },
      ),
      ..._municipalitiesComboBox(),
      ..._suburbsComboBox(),
      TEAButton(
        action: _validateForm,
        label: 'Siguiente',
        icon: Icons.arrow_forward,
        theme: TEAWidgetTheme.secondary,
      ),
    ];
  }

  List<Widget> _municipalitiesComboBox() {
    String state = widget.initialInfo.location.state;
    if (Location.stateIsValid(state)) {
      return <Widget>[
        verticalSpacer,
        Text('🗺️ Municipio', style: TextStyles.h2),
        verticalSpacer,
        FutureBuilder(
          future: Location.getMunicipalities(state),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TEAComboBox(
                options: snapshot.data!,
                onSelect: (String selection) {
                  setState(() {
                    widget.initialInfo.location.municipality = selection;
                  });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: primaryLight),
              );
            }
          },
        ),
      ];
    } else {
      return <Widget>[verticalSpacer];
    }
  }

  List<Widget> _suburbsComboBox() {
    String state = widget.initialInfo.location.state;
    String municipality = widget.initialInfo.location.municipality;
    if (Location.stateIsValid(state) && municipality.isNotEmpty) {
      return <Widget>[
        verticalSpacer,
        Text('🏠️ Colonia', style: TextStyles.h2),
        verticalSpacer,
        FutureBuilder(
          future: Location.getSuburbs(state, municipality),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TEAComboBox(
                options: snapshot.data!,
                onSelect: (String selection) {
                  setState(() {
                    widget.initialInfo.location.suburb = selection;
                  });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: primaryLight),
              );
            }
          },
        ),
        verticalSpacer,
      ];
    } else {
      return <Widget>[verticalSpacer];
    }
  }

  void _validateForm() {
    String state = widget.initialInfo.location.state;
    String municipality = widget.initialInfo.location.municipality;
    String suburb = widget.initialInfo.location.suburb;
    if (widget.initialInfo.sex.isEmpty ||
        state.isEmpty ||
        (Location.stateIsValid(state) &&
            (municipality.isEmpty || suburb.isEmpty))) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.pop(context),
          );
          return const TEAAlertDialog(
            title: 'Falta información',
            content: 'Porfavor llene todos los campos antes de continuar',
          );
        },
      );
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      widget.onNextAction();
    }
  }
}
