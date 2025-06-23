import 'dart:ffi';

import 'package:flutter/material.dart';

class TransaccionProvider extends ChangeNotifier {
  int? id;
  String? tipo;
  TextEditingController monto = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  String? categoria;
  TextEditingController fecha = TextEditingController();
  int get Id => id ?? 0;
  get Tipo => tipo ?? '';
  get Monto => monto;
  get Descripcion => descripcion;
  get Categoria => categoria ?? '';
  get Fecha => fecha;
  set Id(int value) {
    id = value;
    notifyListeners();
  }

  set Tipo(value) {
    tipo = value;
    notifyListeners();
  }

  set Monto(value) {
    monto = value;
    notifyListeners();
  }

  set Descripcion(value) {
    descripcion = value;
    notifyListeners();
  }

  set Categoria(value) {
    categoria = value;
    notifyListeners();
  }

  set Fecha(value) {
    fecha = value;
    notifyListeners();
  }

  clearProvider() {
    id = 0;
    tipo = 'Gasto';
    monto.text = '';
    descripcion.text = '';
    categoria = 'Otros';
    fecha.text = '';
    notifyListeners();
  }
}
