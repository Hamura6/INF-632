import 'package:flutter/material.dart';
import 'package:practica2_app/screen/details_screen.dart';
import 'package:practica2_app/screen/news_screen.dart';
import 'package:practica2_app/screen/product_gallery_screen.dart';
import 'package:practica2_app/screen/restaurant_screen.dart';
import 'package:practica2_app/screen/session_screen.dart';
import 'package:practica2_app/screen/user_screen.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blueGrey[200],
      routes: {
        '/ejercicio1':(context)=>UserScreen(),
        '/ejercicio2':(context)=>RestaurantScreen(),
        '/ejercicio3':(context)=>SessionScreen(),
        '/ejercicio4':(context)=>ProductGalleryScreen(),
        '/ejercicio5':(context)=>NewsScreen(),
        '/details':(context)=>DetailsScreen()
      },
      home: SessionScreen(),
    );
  }
}