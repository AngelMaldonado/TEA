/**
 * Archivo: answer.dart
 * Autores: Angel de Jesús Maldonado Juárez & Carlos Andrés de la Rosa Rincón
 * Fecha: 20 de julio del 2023
 * Descripción: Clase para gestionar las respuestas seleccionadas por el usuario
 *
 * Universidad Autónoma de San Luis Potosí
 * Facultad de Ingeniería
 */

/// Entidad Answer, representa el par de pregunta - respuesta
class Answer {
  // Atributo que almacena la pregunta
  final String question;

  // Mapa que almacena las opciones y sus estados (seleccionado o no)
  Map<String, bool> options = {
    'Rara vez': false,
    'Solo a veces': false,
    'Muchas veces': false,
  };

  // Constructor
  Answer({required this.question});

  // Método para obtener la opción seleccionada
  String getSelectedOption() {
    // Utiliza el método "firstWhere" para encontrar la primera opción seleccionada
    return options.entries.firstWhere((option) => option.value).key;
  }

  // Lista estática de preguntas
  static List<String> questions = <String>[
    '¿Tiene interés por las otras personas?',
    '¿Señala para pedir lo que quiere?',
    '¿Señala para mostrar lo que le gusta?',
    '¿Responde a su nombre cuando se le llama?',
    '¿Juega adecuadamente con juguetes (sin metérselos a la boca, aventarlos, girarlos, o formarlos)?',
    '¿Establece y mantiene el contacto visual con otros?',
    '¿Se muestra aislado de otras personas?',
  ];
}
