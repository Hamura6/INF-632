import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class SumarDigitosScreen extends StatefulWidget {
  const SumarDigitosScreen({super.key});

  @override
  State<SumarDigitosScreen> createState() => _SumarDigitosScreenState();
}

class _SumarDigitosScreenState extends State<SumarDigitosScreen> {
  final TextEditingController _number=TextEditingController();
  int _result=0;
  void _count(){

      _result=0;

    for(int i=0;i<_number.text.length;i++){
      _result+=int.parse(_number.text[i]);
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sumar digitos',
      contenido: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          children: [
            TextFieldWidgetInt(
              label: 'Ingrese un numero', 
              number1: _number
              ),
            FilledButton(
              onPressed: _count, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check),
                  Text('Calcular')
                ],
              )
              ),
              Text('La suma de sus digitos es: ${_result}')
          ],
        ),
      ), 
      );
  }
}
