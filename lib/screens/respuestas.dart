import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Respuestas extends StatelessWidget {
  const Respuestas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469CBF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF469CBF),
        elevation: 0,
        title: const Center(child: Text('Respuestas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
        ),
      ),
      body: FutureBuilder<Map<int, String?>>(
        future: _getResponses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al obtener las respuestas'));
          } else {
            final responses = snapshot.data!;
            return Column(
              children: [                
                Expanded(
                  child: ListView.builder(
                    itemCount: responses.length,
                    itemBuilder: (context, index) {
                      final questionNumber = index + 1;
                      final response = responses[questionNumber];
                      return ListTile(
                        title: Text(
                          'Pregunta $questionNumber:       Respuesta: ${response ?? 'No respondida'}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                ElevatedButton(
                  onPressed: () { Navigator.of(context).pop();},  
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30.0, 60.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (30.0)),
                  ),
                  child: const Text('Volver',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Método para obtener las respuestas guardadas
  Future<Map<int, String?>> _getResponses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<int, String?> respuestas = {};
    for (int i = 1; i <= 6; i++) {
      respuestas[i] = prefs.getString('Respuesta_$i');
    }
    return respuestas;
  }
}
