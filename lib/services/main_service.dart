/// Archivo: main_service.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
/// Fecha: 20 de julio del 2023
/// Descripción: Clase para enviar los datos obtenidos a Firestore
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea/models/tea_record.dart';

// Función para enviar datos a Firestore
Future saveTEARecord(TEARecord teaRecord) async {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('registros-app');
  // Crear una referencia a la colección en Firestore
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('notFirstTime')) {
      throw Exception();
    }
    await collection.add({
      'timestamp': FieldValue.serverTimestamp(),
      'estado': teaRecord.initialInfo.location.state,
      'municipio': teaRecord.initialInfo.location.municipality,
      'colonia': teaRecord.initialInfo.location.suburb,
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
