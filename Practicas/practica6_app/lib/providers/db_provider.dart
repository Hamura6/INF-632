import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:practica6_app/models/transaccion.dart';
export 'package:practica6_app/models/transaccion.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DBProvider extends ChangeNotifier{
  static Database? _database;
  static final DBProvider db=DBProvider.private();

  DBProvider.private();
  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database=await initDB();
    return _database!;
  }
  initDB() async{
    Directory documentsDirectory= await getApplicationDocumentsDirectory();
    String path=join(documentsDirectory.path,'Trans.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db,int version)async{
        await db.execute(
          'CREATE TABLE transacciones('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'monto  REAL,'
          'descripcion TEXT,'
          'categoria TEXT,'
          'fecha TEXT'
          ')'
        );
      }
      ); 
  }
  //CREAR REGISTROS
  nuevoTransaccionRaw(Transaccion nuevoTrans) async{
    final db=await database;
    final res=await db.rawInsert(
      "INSERT INTO transacciones (tipo,monto,descripcion,categoria,fecha) "
      "VALUES ('${nuevoTrans.tipo}',${nuevoTrans.monto},'${nuevoTrans.descripcion}','${nuevoTrans.categoria}','${nuevoTrans.fecha}')"
    );
    return res;
  }

nuevoTrans(Transaccion nuevoTrans) async{ 
 final db=await database ;
 Map result=await getResumenIngresosYGastos();
  notifyListeners();
 if(result['Ingreso']<nuevoTrans.monto && nuevoTrans.tipo=='Gasto'){
  return 0;
 }else{
  final res=db.insert('transacciones', nuevoTrans.toJson());
 return res;
 }
}
Future<Transaccion?>  getTransaccionId(int id) async{
    final db=await database;
    final res=await db.query('transacciones',where:'id=?',whereArgs: [id]);
    return res.isNotEmpty?Transaccion.fromJson(res.first):null; 
  }
Future<List<Transaccion>> getTransacciones() async{
  final db=await database;
  final res=await db.query('transacciones',orderBy: 'id DESC');
  List<Transaccion> list=res.isNotEmpty
  ? res.map((p)=>Transaccion.fromJson(p)).toList()
  :[];
  notifyListeners();
  return list;
}
Future<List<Transaccion>> getTransaccionesPorTipo(String tipo,DateTime inicio,DateTime fin) async{
  
  String query;
  if(tipo=='Todos'){
    query="SELECT * FROM transacciones WHERE fecha >='${inicio.toIso8601String()}' AND fecha<='${fin.toIso8601String()}'";
  }else{
    query="SELECT * FROM transacciones WHERE tipo='$tipo' AND fecha >='${inicio.toIso8601String()}' AND fecha<='${fin.toIso8601String()}'";
  }
  final db=await database;
  final res=await db.rawQuery(query);
  List<Transaccion> list=res.isNotEmpty
  ? res.map((p)=>Transaccion.fromJson(p)).toList()
  :[];
  return list;
}






//Actualizar registor
updateTransaccion(Transaccion nuevoTrans)async{
  final db=await database;
  Map result=await getResumenIngresosYGastos();
  notifyListeners();
 if(result['Ingreso']<nuevoTrans.monto && nuevoTrans.tipo=='Gasto'){
  return 0;
 }else{
  final res=db.update('transacciones', nuevoTrans.toJson(),where: 'id=?',whereArgs: [nuevoTrans.id]);
  return res;
 }

}

//Elimianr registros
deleteTransacciones(int id)async{
  final db=await database;
  final res=db.delete('transacciones',where: 'id=?',whereArgs: [id]);
  return res;
}
deleteAll(int id)async{
  final db=await database;
  final res=db.rawDelete("DELETE FROM transacciones ");
  return res;
}
Future<void> imprimirTransaccionesPdf(List<Transaccion> transacciones, String tipoFiltro) async {
  final pdf = pw.Document();
  final formatter = DateFormat('dd/MM/yyyy');

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (context) => [
        pw.Text('Transacciones ($tipoFiltro)',
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 16),
        pw.Table.fromTextArray(
          cellAlignment: pw.Alignment.centerLeft,
          headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          headers: ['Fecha', 'Tipo', 'Categoría', 'Monto'],
          data: transacciones.map((t) {
            return [
              t.fecha, // o usa formatter.format(DateTime.parse(t.fecha)) si es ISO
              t.tipo,
              t.categoria,
              '\Bs ${t.monto.toStringAsFixed(2)}',
            ];
          }).toList(),
        ),
      ],
    ),
  );

  await Printing.layoutPdf(
    onLayout: (format) => pdf.save(),
  );
}




Future<Map<String, double>> getResumenIngresosYGastos() async {
  final db = await database;

  final ingresosResult = await db.rawQuery(
    "SELECT SUM(monto) as total FROM transacciones WHERE tipo = 'Ingreso'"
  );

  final gastosResult = await db.rawQuery(
    "SELECT SUM(monto) as total FROM transacciones WHERE tipo = 'Gasto'"
  );

  final ingresos = ingresosResult.first['total'] as double? ?? 0.0;
  final gastos = gastosResult.first['total'] as double? ?? 0.0;

  return {
    'Ingreso': ingresos,
    'Gasto': gastos,
  };
}



}