import 'dart:convert';

import 'package:flutter/services.dart';

class Location {
  late String state;
  late String municipality;
  late String suburb;

  Location() {
    state = '';
    municipality = '';
    suburb = '';
  }

  static Future<List<String>> getMunicipalities(String state) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/$state.json');
      final list = json.decode(jsonData) as List<dynamic>;
      final List<String> data =
          list.map((state) => state['municipio'].toString()).toSet().toList();
      data.sort();
      return data;
    } catch (ex) {
      return [];
    }
  }

  static Future<List<String>> getSuburbs(
    String state,
    String municipality,
  ) async {
    final jsonData = await rootBundle.loadString('assets/data/$state.json');
    final list = json.decode(jsonData) as List<dynamic>;
    final data = list
        .where((state) => state['municipio'] == municipality)
        .map((state) => state['colonia'].toString())
        .toList();
    data.sort();
    return data;
  }

  static bool stateIsValid(String state) {
    return validStates.contains(state);
  }

  static List<String> validStates = ["San Luis Potosí"];

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
