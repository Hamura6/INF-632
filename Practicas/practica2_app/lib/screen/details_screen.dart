import 'package:flutter/material.dart';
import 'package:practica2_app/config/helpers/get_news.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
  final int id=ModalRoute.of(context)!.settings.arguments as int;
  final item=GetNews().find(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
         backgroundColor: const Color(0xFF032A4A),
         foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(83, 4, 50, 88).withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                spacing: 1,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                        ,fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        item.image,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    item.details,
                    style: TextStyle(
                      fontSize: 17,
                      color:const Color.fromARGB(255, 205, 205, 205),
                      wordSpacing: 5
                    ),
                    textAlign: TextAlign.justify,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}