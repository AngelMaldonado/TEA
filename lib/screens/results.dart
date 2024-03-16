/// Archivo: results.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa
/// Fecha: 31 de julio del 2023
/// Descripción: Clase que representa la pantalla de resultados del TEA
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:flutter/material.dart';
import 'package:tea/models/tea_record.dart';
import 'package:tea/services/main_service.dart';
import 'package:tea/utils/buttons.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/utils/fonts.dart';
import 'package:tea/widgets/tea_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/tea_appbar.dart';

class Results extends StatelessWidget {
  final TEARecord teaRecord; // Variable que almacena un registro.
  final Function onBackAction; // Función que se ejecutará cuando se active la acción de retroceso.

  // Constructor de la clase Results.
  const Results({
    super.key,
    required this.teaRecord, // Se requiere un registro TEARecord.
    required this.onBackAction, // Se requiere una función onBackAction.
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TEAAppBar(
        title: 'Resultado',
        action: onBackAction,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: FutureBuilder(
                future: saveTEARecord(teaRecord),// Llamada para guardar el registro TEA
                builder: (context, _) => _resultsWidgets(context), // Construye los widgets de resultados
              ),
            ),
          ),
        ],
      ),
    );
  }
 // Método para construir los widgets de resultados
  Widget _resultsWidgets(BuildContext context) {
    return Padding(
      padding: appPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ..._messages(),// Muestra información de respuestas
          verticalSpacer,
          ..._especialistas(),// Muestra información de especialistas
          verticalSpacer,
          TEAButton(
            action: () => Navigator.pushNamed(context, 'splash'),
            label: 'Volver al inicio',
          ),
        ],
      ),
    );
  }

  List<Widget> _messages() {
    return <Widget>[
      Text(
        teaRecord.hasAutism ? positiveResultMessage : negativeResultMessage,
        style: TextStyles.h3,
        textAlign: TextAlign.center,
      ),
      verticalSpacer,
      Text(
        finalMessage,
        style: TextStyles.p_shadowed,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _especialistas() {
    return <Widget>[
      Text('Algunos especialistas:', style: TextStyles.h3),
      verticalSpacer,
      _phoneTile('Hospital del niño y la mujer', telHospitalNinoyMujer),
      verticalSpacer,
      _phoneTile('País de las maravillas', telPaisDeMaravillas),
      verticalSpacer,
      _phoneTile('Temazcalli', telTemazcalli),
    ];
  }

  Widget _phoneTile(String title, String phoneNumber) {
    String displayedPhoneNumber =
      phoneNumber.length >= 18 ? phoneNumber.substring(0, 18) : phoneNumber;

    return Expanded(
      child: ListTile(
        title: Text(title, style: TextStyles.p_shadowed),
        subtitle: Text(phoneNumber), // Muestra el número original en el subtítulo
        trailing: ElevatedButton(
          style: ButtonStyles.elevatedSecondary,
          onPressed: () => launchUrl(Uri(scheme: 'tel', path: displayedPhoneNumber)), // Muestra el número sin extensión
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Llamar', style: TextStyles.p_black),
              horizontalSpacer,
              const Icon(Icons.phone),
            ],
          ),
        ),
      ),
    );
  }
}
