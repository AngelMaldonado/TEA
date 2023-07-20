import 'package:flutter/material.dart';
import 'package:tea/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      initialRoute: '/',
      routes:{
        '/':(context) => const HomePage(),
      },
    );
  }
}