import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pregunta1 extends StatefulWidget {
  const Pregunta1({super.key});

  @override
  State<Pregunta1> createState() => _Pregunta1State();
}

class _Pregunta1State extends State<Pregunta1> {

  // Guarda el diagnóstico actual
  bool resultado = false;

  // Indica cual respuesta está seleccionada
  bool? _respuesta1Checked = false;
  bool? _respuesta2Checked = false;
  bool? _respuesta3Checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469CBF),
      
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF469CBF),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            iconSize: 30,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 17),
              child: Center(
                child: Text(
                  '1/6',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Odin', 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Pregunta #1 
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text('¿Tiene interés por los otros y responde cuando se le habla?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Animación
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/anim1.png',
                  height: 300,
                  width: 300,
                ),
              ),
              
              // Checklist de respuestas
              SizedBox(
                width: 260,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      // Respuesta NUNCA
                      CheckboxListTile(
                        title: 
                          const Text('Nunca',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        activeColor: Colors.white,
                        selectedTileColor: const Color(0xFF469CBF),
                        checkColor: const Color(0xFF469CBF),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                              
                        value: _respuesta1Checked,
                        onChanged: (bool? value) { 
                          setState(() {
                            if (value == true) {
                              resultado = true;
                              _saveResponse('Nunca');
                              _respuesta2Checked = false;
                              _respuesta3Checked = false;
                            } 
                            _respuesta1Checked = value;
                          });                        },                        
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      
                      // Respuesta A VECES
                      CheckboxListTile(
                        title: 
                          const Text('A veces',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        activeColor: Colors.white,
                        checkColor: const Color(0xFF469CBF),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        
                        value: _respuesta2Checked,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _saveResponse('A veces');
                              _respuesta1Checked = false;
                              _respuesta3Checked = false;
                            } 
                            _respuesta2Checked = value;
                          });
                        },                  
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                        
                      // Respuesta MUCHAS VECES                
                      CheckboxListTile(
                        title: 
                          const Text('Muchas veces',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        activeColor: Colors.white,
                        checkColor: const Color(0xFF469CBF),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                          
                        value: _respuesta3Checked,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _saveResponse('Muchas veces');
                              _respuesta1Checked = false;
                              _respuesta2Checked = false;
                            } 
                            _respuesta3Checked = value;
                          });
                        },
                  
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
              ),
        
              // Botón (Siguiente)
              Padding(
                padding: const EdgeInsets.only(left: 80.0, top: 20.0, right: 80.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () { Navigator.pushNamed(context ,"pregunta_2", arguments: resultado);},
              
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (30.0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),                     
                        child:Text('Siguiente',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 23,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ), 
            ],
          ),
        ),
      //),
    );
  }

  // Guardar la respuesta seleccionada
  void _saveResponse(String respuesta) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Respuesta_1', respuesta);
  }
}