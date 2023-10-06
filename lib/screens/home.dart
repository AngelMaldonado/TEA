import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tea/screens/info.dart';
import 'package:tea/utils/constants.dart';
import 'package:tea/widgets/tea_text.dart';
import 'package:tea/widgets/tea_alert_dialog.dart';
import 'package:tea/widgets/tea_button.dart';

import '../utils/tea_theme.dart';

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
          padding: appPadding,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/logo.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    SizedBox(height: 16.h),
                    const TEAText(
                      'Bienvenido a TEA',
                      alignment: TextAlign.center,
                      textStyle: TEATextStyle.h2,
                    ),
                    SizedBox(height: 16.h),
                    const TEAText(
                      'A continuación, se le realizarán seis preguntas para un '
                      'acercamiento del espectro autista en su hijo.\nAntes de '
                      'iniciar la encuesta, le sugerimos indagar más acerca del '
                      'espectro autista pulsando el botón "TEA".',
                      alignment: TextAlign.center,
                      textStyle: TEATextStyle.p,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 42.h),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TEAButton(
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Info()),
                    ),
                    label: 'TEA',
                  ),
                  const SizedBox(height: 12),
                  TEAButton(
                    label: 'Comenzar',
                    icon: Icons.arrow_forward,
                    theme: TEAWidgetTheme.secondary,
                    action: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return TEAAlertDialog(
                            title: 'Advertencia',
                            content: alertText,
                            action: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                'questions',
                              );
                            },
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
