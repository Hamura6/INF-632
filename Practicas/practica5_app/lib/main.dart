import 'package:flutter/material.dart';
import 'package:practica5_app/presentation/providers/auth_provider.dart';
import 'package:practica5_app/presentation/providers/theme_provider.dart';
import 'package:practica5_app/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});       

  @override
  Widget build(BuildContext context) {
    final _themeProvider=context.watch<ThemeProvider>();
    return MaterialApp(
        theme: ThemeData(colorScheme:_themeProvider.theme),
        home: Scaffold(
          body: LoginScreen(),
        ),
      );
  }
}
