import 'package:ecotips_app/presentation/screens/details_page.dart';
import 'package:ecotips_app/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'vistas',
      color: Colors.blue,
      //definiendo rutas de navegacion
      routes: {
        '/homepage':(context)=>HomePage(),
        '/detailPage':(context)=>DetailsPage()
      },
      home: HomePage(),
    );
  }
}