import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/screens/contar_vocales_screen.dart';
import 'package:practica3_app/presentation/screens/factorial_screen.dart';
import 'package:practica3_app/presentation/screens/fibonacci_screen.dart';
import 'package:practica3_app/presentation/screens/invertir_numero_screen.dart';
import 'package:practica3_app/presentation/screens/mci_screen.dart';
import 'package:practica3_app/presentation/screens/numero_amigo_screen.dart';
import 'package:practica3_app/presentation/screens/numero_capicua.dart';
import 'package:practica3_app/presentation/screens/numero_perfecto_screen.dart';
import 'package:practica3_app/presentation/screens/numero_primo_screen.dart';
import 'package:practica3_app/presentation/screens/sumar_digitos_screen.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue[900]),
      routes: {
        '/ejercicio1':(context)=>NumeroAmigoScreen(),
        '/ejercicio2':(context)=>NumeroCapicua(),
        '/ejercicio3':(context)=>ContarVocalesScreen(),
        '/ejercicio4':(context)=>SumarDigitosScreen(),
        '/ejercicio5':(context)=>NumeroPerfectoScreen(),
        '/ejercicio6':(context)=>MciScreen(),
        '/ejercicio7':(context)=>NumeroPrimoScreen(),
        '/ejercicio8':(context)=>InvertirNumeroScreen(),
        '/ejercicio9':(context)=>FactorialScreen(),
        '/ejercicio10':(context)=>FibonacciScreen(),
      },
      home: NumeroAmigoScreen(),
    );
  }
}