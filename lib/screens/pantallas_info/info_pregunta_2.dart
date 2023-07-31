import 'package:flutter/material.dart';

class InfoPregunta2 extends StatelessWidget {
  const InfoPregunta2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469CBF),
      
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF469CBF),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            iconSize: 30,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 17),
              child: Center(
                child: Text(
                  '1/6',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Odin', 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Pregunta #1 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Falta de interés por los otros y no responde cuando se le habla?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Animación
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/anim1.png',
                height: 300,
                width: 300,
              ),
            ),

            // Información acerca de la pregunta 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Cuando un niño muestra falta de interés por los demás y no responde adecuadamente cuando se le habla, puede ser un indicio de posibles dificultades sociales o de comunicación que podrían estar relacionadas con TEA.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Botón (Siguiente)
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 20.0, right: 80.0, bottom: 20.0),
              child: ElevatedButton(
                onPressed: () { Navigator.pushNamed(context ,"info_pregunta_2");},
            
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60.0),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (30.0)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),                     
                      child:Text('Siguiente',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 23,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}