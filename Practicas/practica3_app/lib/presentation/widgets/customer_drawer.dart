import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/item_drawer.dart';
class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/toji.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(192, 4, 34, 75), 
                    BlendMode.darken
                    )
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bienvenido',
                    style: TextStyle(
                      fontSize: 50,
                      color:Colors.white
                    ),
                    
                    )
                  ],
                ),
            ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: 
                Column(
                  children: [
                    ItemDrawer(route: '/ejercicio1', name: 'Ejercicio1', icons: Icons.home),
                    ItemDrawer(route: '/ejercicio2', name: 'Ejercicio2', icons: Icons.check),
                    ItemDrawer(route: '/ejercicio3', name: 'Ejercicio3', icons: Icons.search),
                    ItemDrawer(route: '/ejercicio4', name: 'Ejercicio4', icons: Icons.money),
                    ItemDrawer(route: '/ejercicio5', name: 'Ejercicio5', icons: Icons.call_sharp),
                    ItemDrawer(route: '/ejercicio6', name: 'Ejercicio6', icons: Icons.view_agenda),
                    ItemDrawer(route: '/ejercicio7', name: 'Ejercicio7', icons: Icons.tram_sharp),
                    ItemDrawer(route: '/ejercicio8', name: 'Ejercicio8', icons: Icons.create),
                    ItemDrawer(route: '/ejercicio9', name: 'Ejercicio9', icons: Icons.picture_as_pdf),
                    ItemDrawer(route: '/ejercicio10', name: 'Ejercicio10', icons: Icons.expand_circle_down),
                  ],
                ),
                )
            
        ],
      ),
    );
  }
}