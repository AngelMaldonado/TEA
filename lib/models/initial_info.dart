/**
 * Archivo: initial_info.dart
 * Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
 * Fecha: 20 de julio del 2023
 * Descripción: Clase que almacena información inicial
 *
 * Universidad Autónoma de San Luis Potosí
 * Facultad de Ingeniería
 */

/// Importación de bibliotecas
import 'package:tea/models/location.dart';

/// Entidad InitialInfo que representa la información inicial del usuario
class InitialInfo {
  // Atributo para almacenar la edad
  late int age;

  // Atributo para almacenar el género
  late String sex;

  // Atributo para almacenar la ubicación
  late Location location;

  // Constructor
  InitialInfo() {
    // Inicializa la edad con el valor "18 meses" por defecto
    age = 18;
    // Inicializa el género con una cadena vacía por defecto
    sex = '';
    // Inicializa la ubicación utilizando un objeto de la clase "Location"
    location = Location();
  }
}
