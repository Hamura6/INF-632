import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaccion extends ChangeNotifier { 
int? id; 
String tipo; // "ingreso" o "gasto" 
double monto; 
String descripcion; 
String categoria; 
DateTime fecha; 
Transaccion({ 
this.id, 
required this.tipo, 
required this.monto, 
required this.descripcion, 
required this.categoria, 
required this.fecha, 
}); 
factory Transaccion.fromJson(Map<String, dynamic> json)=>new Transaccion(
  id: json['id'], 
  tipo: json['tipo'], 
  monto: json['monto'], 
  descripcion: json['descripcion'], 
  categoria: json['categoria'], 
  fecha: DateTime.parse(json['fecha']),
  );
Map<String, dynamic> toJson()=>{
  "tipo": tipo, 
  "monto": monto, 
  "descripcion": descripcion, 
  "categoria": categoria, 
  "fecha": fecha.toIso8601String()
};
get Fecha=>DateFormat('yyyy-MM-dd HH:mm').format(fecha);
} 