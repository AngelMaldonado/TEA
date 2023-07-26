import 'package:flutter/foundation.dart' ;

class ResultadoProvider with ChangeNotifier {
  bool _resultado = false;

  bool get resultado => _resultado;

  Future<void> setResultado({required bool value}) async {
    _resultado = value;
    notifyListeners();
  }
}
