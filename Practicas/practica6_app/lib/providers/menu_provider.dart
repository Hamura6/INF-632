import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> options=[];
  _MenuProvider();
  Future<List<dynamic>> cargarData() async{
    final result=await rootBundle.loadString('data/menu-opts.json');
    Map dataMap=json.decode(result);
    options=dataMap["rutas"];
    return options;
  }
}
final menuProvider =_MenuProvider();