import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea/models/tea_record.dart';

// Función para enviar datos a Firestore
Future saveTEARecord(TEARecord teaRecord) async {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('registros');
  // Crear una referencia a la colección en Firestore
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('notFirstTime')) {
      throw Exception();
    }
    await collection.add({
      'timestamp': FieldValue.serverTimestamp(),
      'municipio': teaRecord.initialInfo.municipality,
      'cp': teaRecord.initialInfo.cp,
      'sexo': teaRecord.initialInfo.sex,
      'edad': teaRecord.initialInfo.age,
      'respuestas': teaRecord.getAnswerStrings(),
      'resultado': teaRecord.hasAutism,
    });
    prefs.setBool('notFirstTime', true);
  } catch (e) {
    return;
  }
}
