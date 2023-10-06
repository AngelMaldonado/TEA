import 'package:cloud_firestore/cloud_firestore.dart';

// Crear una referencia a la colección en Firestore
final CollectionReference registros = FirebaseFirestore.instance.collection('registros');

// Función para enviar datos a Firestore
Future<void> guardaDatos(int cp, int edad, String municipio, String sexo, List<String> respuestas, bool resultado) async {
  try {
    await registros.add({
      'timestamp': FieldValue.serverTimestamp(),
      'municipio': municipio, 
      'cp': cp,
      'sexo': sexo, 
      'edad': edad,
      'respuestas': respuestas,
      'resultado': resultado,
    });
  } catch (e) {
    print('Error al enviar datos a Firestore: $e');
  }
}