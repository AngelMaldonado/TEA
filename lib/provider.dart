import 'package:flutter/foundation.dart' ;


class ResultadoProvider with ChangeNotifier {
  bool _resultado = false;

  bool get resultado => _resultado;

  Future<void> setResultado({required bool value}) async {
    _resultado = value;
    notifyListeners();
  }
}

class InitialDataProvider with ChangeNotifier {
  int _cp = 78000;
  int _edad = 18;
  String _municipio = 'San Luis Potosí';
  String _sexo = 'default';

  int get cp => _cp;
  int get edad => _edad;
  String get municipio => _municipio;
  String get sexo => _sexo;

  void setData({
    required int newCp,
    required int newEdad,
    required String newMunicipio,
    required String newSexo,
  }) {
    _cp = newCp;
    _edad = newEdad;
    _municipio = newMunicipio;
    _sexo = newSexo;
    notifyListeners();
  }
}
