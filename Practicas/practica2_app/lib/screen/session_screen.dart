import 'package:flutter/material.dart';
import 'package:practica2_app/widgets/custom_drawer.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Session'),
        backgroundColor: const Color(0xFF032A4A),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: const Color.fromARGB(255, 3, 45, 80),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/toji.png', fit: BoxFit.cover),
            ),
          ),
          Container(
            color: const Color(0xBD011322).withOpacity(0.9), // 50% opacidad
          ),
          Positioned(
            bottom: 650,
            left: 180,
            child: Text(
              'LOGIN',style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingrese su email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 40,
                    width: 380,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ejemplo@gmail.com',
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Contraseña',
                    key: Key("*"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 40,
                    width: 380,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 50,right: 50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(const Color(0xFF032A4A)) ,
                        foregroundColor: WidgetStatePropertyAll(Colors.white)
                      ),
                              onPressed: (){
                                _mostrarAlert(context);
                              }, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.key),
                                  SizedBox(width: 10,),
                                  Text('Ingresar')
                                ],
                              )
                              )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        TextButton(
                          onPressed: null,
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            'Registrate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Usuario invalido'),
          content: Text('Verifique su correo o contraseña'),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);

            }, child: Text('Aceptar'),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(const Color(0xFF032A4A),),
              foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),
            )
          ],
        );
      }
      );
  }
}
