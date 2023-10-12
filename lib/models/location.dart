/// Archivo: location.dart
/// Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
/// Fecha: 20 de julio del 2023
/// Descripción: Clase para manejar información de ubicación
///
/// Universidad Autónoma de San Luis Potosí
/// Facultad de Ingeniería

import 'dart:convert';

import 'package:flutter/services.dart';

class Location {
  // Atributos para almacenar el estado, municipio y colonia
  late String state;
  late String municipality;
  late String suburb;

  // Constructor de la clase "Location"
  Location() {
    // Inicializa los atributos con cadenas vacías por defecto
    state = '';
    municipality = '';
    suburb = '';
  }

  // Método estático para obtener la lista de municipios basada en el estado
  static Future<List<String>> getMunicipalities(String state) async {
    try {
      // Carga datos JSON desde el archivo correspondiente en la carpeta 'assets'
      final jsonData = await rootBundle.loadString('assets/data/$state.json');
      
      // Convierte los datos JSON en una lista de mapas
      final list = json.decode(jsonData) as List<dynamic>;
      
      // Extrae los nombres de los municipios y elimina duplicados
      final List<String> data =
          list.map((state) => state['municipio'].toString()).toSet().toList();
      
      // Ordena la lista alfabéticamente y la devuelve
      data.sort();
      return data;
    } catch (ex) {
      // En caso de error, retorna una lista vacía
      return [];
    }
  }

  // Método estático para obtener la lista de colonias basada en el estado y municipio
  static Future<List<String>> getSuburbs(
    String state,
    String municipality,
  ) async {
    // Carga datos JSON desde el archivo correspondiente en la carpeta 'assets'
    final jsonData = await rootBundle.loadString('assets/data/$state.json');
    
    // Convierte los datos JSON en una lista de mapas
    final list = json.decode(jsonData) as List<dynamic>;
    
    // Filtra las colonias correspondientes al estado y municipio
    final data = list
        .where((state) => state['municipio'] == municipality)
        .map((state) => state['colonia'].toString())
        .toList();
    
    // Ordena la lista alfabéticamente y la devuelve
    data.sort();
    return data;
  }

  // Método estático para verificar si un estado es válido
  static bool stateIsValid(String state) {
    return validStates.contains(state);
  }

  // Lista de estados válidos
  static List<String> validStates = ["San Luis Potosí"];

  // Lista de todos los estados
  static List<String> states = [
    "Aguascalientes",
    "Baja California",
    "Baja California Sur",
    "Campeche",
    "Chiapas",
    "Chihuahua",
    "Coahuila",
    "Colima",
    "Durango",
    "Guanajuato",
    "Guerrero",
    "Hidalgo",
    "Jalisco",
    "México",
    "Michoacán",
    "Morelos",
    "Nayarit",
    "Nuevo León",
    "Oaxaca",
    "Puebla",
    "Querétaro",
    "Quintana Roo",
    "San Luis Potosí",
    "Sinaloa",
    "Sonora",
    "Tabasco",
    "Tamaulipas",
    "Tlaxcala",
    "Veracruz",
    "Yucatán",
    "Zacatecas",
  ];
}
