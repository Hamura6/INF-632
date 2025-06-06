import 'package:flutter/material.dart';
import 'package:practica5_app/presentation/providers/auth_provider.dart';
import 'package:practica5_app/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
class HomeScreen  extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {


    final themeProvider=context.watch<ThemeProvider>();
    final authProvider=context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Text('Pantalla principal'),
        actions: [
          Icon(Icons.mode_night_rounded),
          Switch(
            value: themeProvider.status, 
            onChanged: themeProvider.change,
            inactiveThumbColor: Colors.grey,
            activeColor: Colors.lightBlue[900],
            )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Hola, ${authProvider.user}',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.blue[200],
              fontWeight: FontWeight.bold
          
            ),
            textAlign: TextAlign.center,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      },child: Icon(Icons.logout ),),
    );
  }
}