import 'package:flutter/material.dart';
import 'package:sumar_dos_numeros_app/presentation/screens/suma_screen.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue[900]),
      title: 'Suma de dos numeros',
      home: SumaScreen(),
    );
  }
}