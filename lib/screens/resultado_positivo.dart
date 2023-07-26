import 'package:flutter/material.dart';

class ResultadoPositivo extends StatelessWidget {
  const ResultadoPositivo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469CBF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF469CBF),
        elevation: 0,
        title: const Center(child: Text('Resultado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.yellow,
                    size: 25,
                  ),
                ),
          
                Text('Existe sospecha de TEA',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
            child: Text(
              'Recuerde que este resultado no constituye un diagnóstico, pero es importante que consulte con un profesional de la salud para una evaluación más precisa.',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Text(
              'A continuación puede consultar un directorio de especialistas en TEA o revisar sus respuestas enviadas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () { Navigator.pushNamed(context ,"directorio");},  
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(30.0, 60.0),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (30.0)),
            ),
            child: const Text('Directorio',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () { Navigator.pushNamed(context ,"respuestas");},  
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(30.0, 60.0),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (30.0)),
            ),
            child: const Text('Revisar respuestas',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
