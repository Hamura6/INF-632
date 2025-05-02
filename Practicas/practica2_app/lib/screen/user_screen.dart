import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practica2_app/widgets/custom_drawer.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tarjeta de Perfil de Usuario'),
            Icon(Icons.edit,color: Colors.white,  )
          ],
        ),
        backgroundColor: const Color(0xFF032A4A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset('assets/images/toji.png')),

                  Text('Nombre:',style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),),
                  Text('Toji Fushiguro'),
                  Text('Descripcion:',style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),),
                  Text('Toji Fushiguro es un personaje del anime y manga Jujutsu Kaisen, creado por Gege Akutami. Es conocido por ser un antagonista clave durante el arco del "Pasado de Gojo".'),
                  Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: null, 
                        icon: Icon(FontAwesomeIcons.whatsapp),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                        ),
                        ),
                        IconButton(
                        onPressed: null, 
                        icon: Icon(FontAwesomeIcons.twitter),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(const Color(0xFF035DA7)),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                        ),
                        ),
                        IconButton(
                        onPressed: null, 
                        icon: Icon(FontAwesomeIcons.youtube),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(const Color(0xFFA30C01)),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                        ),
                        ),
                         IconButton(
                        onPressed: null, 
                        icon: Icon(FontAwesomeIcons.facebook),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(const Color(0xFF035DA7)),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                        ),
                        )
                    ],
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}