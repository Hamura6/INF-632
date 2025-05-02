import 'package:flutter/material.dart';
import 'package:practica2_app/config/helpers/get_platos.dart';
import 'package:practica2_app/widgets/custom_drawer.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items=GetPlatos().get();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Menu restaurante'),
        backgroundColor: const Color(0xFF032A4A),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(items[index].images,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          
                          ),
                        ),
                      ),
                    ),
                    Text(
                      items[index].name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 2, 43, 78)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Precio:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20
                        ),
                        ),
                        Text('${items[index].price} Bs')
                      ],
                    ),
                    Row(
                      children: [
                        for(int i=0;i<items[index].value;i++)
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 205, 154, 1),
                            )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
