import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_string.dart';
class InvertirNumeroScreen extends StatefulWidget {
  const InvertirNumeroScreen({super.key});

  @override
  State<InvertirNumeroScreen> createState() => _InvertirNumeroScreenState();
}

class _InvertirNumeroScreenState extends State<InvertirNumeroScreen> {
  final TextEditingController _number1=TextEditingController();
  String _result='';
  void _invertir(){
    setState(() {
      
    _result=_number1.text.split('').reversed.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Invertir',
      contenido: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFieldWidgetString(label: 'Ingresar dato', number1: _number1),
            FilledButton(onPressed: _invertir, 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calculate),
                Text('Inevertir')
              ],
            ),
            ),
            Text(_result!=''?'${_number1.text} -> ${_result}':'Ingrese un dato',
            style: TextStyle(
              color: const Color.fromARGB(255, 4, 33, 75),
              fontSize: 20
            ),
             )
          ],
        ),
      ),
    );
  }
}