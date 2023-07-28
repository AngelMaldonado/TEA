import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tea/screens/info.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
import 'package:tea/widgets/tea_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const String alertText = 'El propósito de esta aplicación es recopilar '
        'información sobre el espectro autista en los hijos de los usuarios '
        'y no constituye una prueba oficial de diagnóstico.';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(appMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset('assets/icons/logo_family.svg'),
              Text(
                'Bienvenido a TEA',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'A continuación se le realizarán seis preguntas para un '
                'acercamiento del espectro autista en su hijo.\nAntes de '
                'iniciar la encuesta, le sugerimos indagar más acerca del '
                'espectro autista pulsando el botón "TEA".',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TEAButton(
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Info(),
                      ),
                    ),
                    label: 'TEA',
                  ),
                  const SizedBox(height: 12),
                  TEAButton(
                    label: 'Comenzar',
                    icon: Icons.arrow_forward,
                    theme: TEAButtonTheme.secondary,
                    action: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return TEAAlertDialog(
                            title: 'Advertencia',
                            content: alertText,
                            action: () {},
                            buttonLabel: 'Continuar',
                            buttonIcon: Icons.arrow_forward,
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
