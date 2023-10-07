class Answer {
  static List<String> questions = <String>[
    '¿Tiene interés por las otras personas?',
    '¿Señala para pedir lo que quiere?',
    '¿Señala para mostrar lo que le gusta?',
    '¿Responde a su nombre cuando se le llama?',
    '¿Juega adecuadamente con juguetes (sin metérselos a la boca, aventarlos, girarlos, o formarlos)?',
    '¿Establece y mantiene el contacto visual con otros?',
    '¿No lleva cosas cuando se las pides?',
  ];
  final String question;
  Map<String, bool> options = {
    'Rara vez': false,
    'A veces': false,
    'Muchas veces': false,
  };

  Answer({required this.question});

  String getSelectedOption() {
    return options.entries.firstWhere((option) => option.value).key;
  }
}
