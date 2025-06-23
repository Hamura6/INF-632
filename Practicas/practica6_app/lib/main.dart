import 'package:flutter/material.dart';
import 'package:practica6_app/providers/db_provider.dart';
import 'package:practica6_app/providers/filtros_provider.dart';
import 'package:practica6_app/providers/transaccion_provider.dart';
import 'package:practica6_app/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>DBProvider.private()),
      ChangeNotifierProvider(create: (_)=>TransaccionProvider()),
      ChangeNotifierProvider(create: (_)=>FiltrosProvider())
    ],
    child:const MainApp() ,
    )
     );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      initialRoute: '/',
      routes: getApplicationRoute(),
    );
  }
}
