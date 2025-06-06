import 'package:flutter/material.dart';
import 'package:practica5_app/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
  class LoginScreen extends StatelessWidget {
    const LoginScreen({super.key});
  
    @override
    Widget build(BuildContext context) {
      TextEditingController controller=TextEditingController();
      final authProvider= context.watch<AuthProvider>();
      return  Padding(
        padding: EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login',
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold
                ),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/toji.jpg',
                    fit: BoxFit.fill,
                    width:double.infinity,
                    height: 350,
                    
                    ),
                ),
                
                SizedBox(height: 20,),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: 
                  Text(
                    'Ingresar usuario',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                ),
                
                Text(
                    'Ingresar usuario',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton(
                    onPressed: (){
                    authProvider.verification(controller.text, context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.start),
                        Text('Ingresar'),
                      ],
                    )),
                    FilledButton(
                    onPressed: (){
                    authProvider.verification(controller.text, context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text('Registrarse'),
                      ],
                    ))
                  ],
                )
                
              ],
            ),
        );
    }
  }