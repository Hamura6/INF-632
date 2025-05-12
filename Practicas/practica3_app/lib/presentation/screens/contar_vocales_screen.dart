import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_string.dart';
class ContarVocalesScreen extends StatefulWidget {
  const ContarVocalesScreen({super.key});

  @override
  State<ContarVocalesScreen> createState() => _ContarVocalesScreenState();
}

class _ContarVocalesScreenState extends State<ContarVocalesScreen> {
    final TextEditingController _cadena=TextEditingController();
    int _result=0;
    void _contar(){
      for(int i=0;i<_cadena.text.length;i++){
        if(_cadena.text[i]=='i' || _cadena.text[i]=='a' || _cadena.text[i]=='o' || _cadena.text[i]=='e' || _cadena.text[i]=='u' ){
          _result++;
        }
      }
      setState(() {
        
      });
    }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Contar vocales',
      contenido: 
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          children: [
            TextFieldWidgetString(
              label: 'Ingrese una palabra', 
              number1: _cadena
              ),
              FilledButton(
                onPressed: _contar, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search),
                    Text('Calcular')
                  ],
                )
                ),
                Text(
                  'La palabra tiene ${_result}'+ (_result==1?' vocal ':' vocales'),
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 4, 33, 75)
                  ),
                   )
          ],
        ),
      ));
  }
}