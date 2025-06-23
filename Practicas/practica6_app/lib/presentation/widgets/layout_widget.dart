import 'package:flutter/material.dart';
import 'package:practica6_app/presentation/widgets/customer_drawer.dart';
class LayoutWidget extends StatelessWidget {
  final String title;
  final Widget content;
  const LayoutWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CustomerDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
          child: AppBar(
            backgroundColor: Colors.lightBlue[900],
            foregroundColor: Colors.white,
            title: Text(title),
          ),
        ),
      ),
      body: Container(
        child: content
        ),
    );
  }
}