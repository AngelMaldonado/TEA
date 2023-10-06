import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tea/models/tea_record.dart';

// Función para enviar datos a Firestore
Future<bool> saveTEARecord(TEARecord teaRecord) async {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('registros');
  // Crear una referencia a la colección en Firestore
  try {
    await collection.add({
      'timestamp': FieldValue.serverTimestamp(),
      'municipio': teaRecord.initialInfo.municipality,
      'cp': teaRecord.initialInfo.cp,
      'sexo': teaRecord.initialInfo.sex,
      'edad': teaRecord.initialInfo.age,
      'respuestas': teaRecord.getAnswerStrings(),
      'resultado': teaRecord.hasAutism,
    });
    return true;
  } catch (e) {
    return false;
  }
}
