import 'package:flutter/material.dart';
import 'package:practica4_app/presentation/providers/character_provider.dart';
import 'package:practica4_app/presentation/screens/game_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    
      providers: [
        ChangeNotifierProvider(create: (_)=>CharacterProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GameScreen()
      ),
    );
  }
}
