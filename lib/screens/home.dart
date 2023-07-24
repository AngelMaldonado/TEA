import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/widgets/tea_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                    action: () {},
                    label: 'TEA',
                  ),
                  const SizedBox(height: 12),
                  TEAButton(
                    action: () {},
                    label: 'Comenzar',
                    icon: Icons.arrow_forward,
                    theme: TEAButtonTheme.secondary,
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
