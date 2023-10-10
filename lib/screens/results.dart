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
  final TEARecord teaRecord;
  final Function onBackAction;

  const Results({
    super.key,
    required this.teaRecord,
    required this.onBackAction,
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
                future: saveTEARecord(teaRecord),
                builder: (context, _) => _resultsWidgets(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultsWidgets(BuildContext context) {
    return Padding(
      padding: appPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ..._messages(),
          verticalSpacer,
          ..._especialistas(),
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
    return Expanded(
      child: ListTile(
        title: Text(title, style: TextStyles.p_shadowed),
        subtitle: Text(phoneNumber),
        trailing: ElevatedButton(
          style: ButtonStyles.elevatedSecondary,
          onPressed: () => launchUrl(Uri(scheme: 'tel', path: phoneNumber)),
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
