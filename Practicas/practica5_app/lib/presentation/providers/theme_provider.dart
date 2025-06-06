import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
  ColorScheme _theme=ColorScheme.light();
  bool _status=false;
  get theme=>_theme;
  get status=>_status;
  void change(value){
    _status=value;
    if(_status){
      _theme=ColorScheme.dark();
    }else{
    _theme=ColorScheme.light();

    }
    notifyListeners();
  }

}