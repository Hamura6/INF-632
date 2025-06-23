import 'package:flutter/widgets.dart';
import 'package:practica6_app/presentation/screens/filtros_screen.dart';
import 'package:practica6_app/presentation/screens/historial_screen.dart';
import 'package:practica6_app/presentation/screens/inicio_screen.dart';
import 'package:practica6_app/presentation/screens/new_transaccion_screen.dart';

Map<String,WidgetBuilder> getApplicationRoute(){
  return {
    '/':(BuildContext context)=>InicioScreen(),
    'historial':(BuildContext context)=>HistorialScreen(),
    'transaccion':(BuildContext context)=>NewTransaccionScreen(),
    'filtros':(BuildContext context)=>FiltrosScreen()
  };
}