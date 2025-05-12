import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/customer_drawer.dart';
class Layout extends StatelessWidget {
  final Widget contenido;
  final String title;
  const Layout({super.key, required this.contenido, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomerDrawer(),
      appBar: AppBar(
        title: Text(title),
         backgroundColor: const Color.fromARGB(255, 4, 33, 75),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: contenido
      ),
    );
  }
}