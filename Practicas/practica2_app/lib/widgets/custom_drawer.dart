import 'package:flutter/material.dart';
import 'package:practica2_app/widgets/item_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF032A4A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),

              ],
            ),
          ),
          
          DrawerItem(icon: Icons.book_sharp, text: 'Ejercicio 1', route: '/ejercicio1'),
          ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [
                Icon(Icons.menu),
                SizedBox(width: 12,),
                Text(
                  'Ejercicio 2',
                    style: TextStyle(color: const Color.fromARGB(255, 206, 206, 206),fontSize: 20),
                  ),
              ],
            ),
          ),
          iconColor: Colors.white,
          textColor: Colors.white,
          children: [
            ListTile(
              title: DrawerItem(
            icon: Icons.book_sharp,
            text: 'Platos',
            route: '/ejercicio2'
            ),
            ),
            ListTile(
              title: DrawerItem(
            icon: Icons.book_sharp,
            text: 'Entradas',
            route: '/ejercicio2'
          ),
            ),
          ListTile(
            title: DrawerItem(
            icon: Icons.book_sharp,
            text: 'Postres',
            route: '/ejercicio2'
          ),
          )
          ],
          ),
          
          DrawerItem(
            icon: Icons.book_sharp,
            text: 'Ejercicio 3',
            route: '/ejercicio3',
          ),
          DrawerItem(
            icon: Icons.book_sharp,
            text: 'Ejercicio 4',
            route: '/ejercicio4',
          ),
          DrawerItem(
            icon: Icons.book_sharp,
            text: 'Ejercicio 5',
            route: '/ejercicio5',
          ),
        ],
      ),
    );
  }
}
