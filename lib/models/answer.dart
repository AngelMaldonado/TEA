class Answer {
  static List<String> questions = <String>[
    '¿Tiene interés por los otros y responde cuando se le habla?',
    '¿Usa el dedo índice para señalar, para indicar interés por algo o le lleva objetos para mostrar como indicando “mira”?',
    '¿Responde a su nombre cuando se le llama?',
    '¿Trata de imitar gestos de otros?',
    '¿Juega adecuadamente con juguetes y no solo metérselos a la boca, aventarlos, formarlos insertarlos?',
    '¿Establece y mantiene el contacto visual con otros?',
  ];
  final String question;
  Map<String, bool> options = {
    'Nunca': false,
    'A veces': false,
    'Siempre': false,
  };

  Answer({required this.question});

  String getSelectedOption() {
    return options.entries.firstWhere((option) => option.value).key;
  }
}
