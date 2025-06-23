import 'package:flutter/material.dart';

class FiltrosProvider extends ChangeNotifier{
  String _tipoFiltro = 'Todos';
  DateTime _fechaInicio = DateTime.now().subtract(const Duration(days: 30));
  DateTime _fechaFin = DateTime.now();

  String get tipoFiltro => _tipoFiltro;
  DateTime get fechaInicio => _fechaInicio;
  DateTime get fechaFin => _fechaFin;

  void actualizarFiltros(String tipo, DateTime inicio, DateTime fin) {
    _tipoFiltro = tipo;
    _fechaInicio = inicio;
    _fechaFin = fin;
    notifyListeners();
  }




}
