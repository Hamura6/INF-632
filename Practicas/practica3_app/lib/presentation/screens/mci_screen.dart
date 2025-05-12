import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class MciScreen extends StatefulWidget {
  const MciScreen({super.key});

  @override
  State<MciScreen> createState() => _MciScreenState();
}

class _MciScreenState extends State<MciScreen> {
  final TextEditingController _number1=TextEditingController();
  final TextEditingController _number2=TextEditingController();
    int num1=0;
  void _mci(){
    try{
      num1=int.parse(_number1.text);
      int num2=int.parse(_number2.text);
      while(num2!=0){
        int temp=num2;
        num2=num1%num2;
        num1=temp;
      }

    }catch(e){
      _mostrar(context);
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Maximo Comun Divisor',
      contenido: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          children: [
            TextFieldWidgetInt(
              label: 'Ingrese un numero', 
              number1: _number1
              ),
              TextFieldWidgetInt(
                label: 'Ingrese un numero', 
                number1: _number2
              ),
              FilledButton(
                onPressed:_mci, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calculate),
                    Text('Calcular')
                    ],
                )
                ),
                Text(num1>0?'El maximo comun denominador es: ${num1}':'No tiene maximo comun denominador')
        
          ],
        ),
      ),
    );
  }
}
void _mostrar(context){
  showDialog(
    context: context, 
    builder: (context){
      return AlertDialog(
        title: Text('Error'),
        content: Text('Ingrese un numero valido'),
        actions: [
          FilledButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text('Aceptar')
            )
        ],
      );
    });
}