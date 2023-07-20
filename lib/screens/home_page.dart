import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469CBF),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            
          },
          child: const Text(
            'Comenzar',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
