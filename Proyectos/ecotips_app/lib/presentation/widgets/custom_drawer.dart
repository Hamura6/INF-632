import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //agregar menu lateral en la parte izquierda
    return Drawer(
      //redondear la parte izquierda de arriba y abajo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      backgroundColor: Color.fromARGB(255, 17, 77, 126),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //Agregar el encabezado visual en el menu lateral 
          DrawerHeader(
            child: Text(
              textAlign: TextAlign.center,
              'Menu',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              )
            ),
            //opciones de menu lateral
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: (){
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.newspaper),
              title: Text('Noticias'),
              onTap: null,
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: null,
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.question_answer),
              title: Text('Consultas'),
              onTap: null,
            ),
            
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
              onTap: null,
            )
        ],
      ),
    );
  }
}