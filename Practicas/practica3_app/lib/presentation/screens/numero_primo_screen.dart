import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class NumeroPrimoScreen extends StatefulWidget {
  const NumeroPrimoScreen({super.key});

  @override
  State<NumeroPrimoScreen> createState() => _NumeroPrimoScreenState();
}

class _NumeroPrimoScreenState extends State<NumeroPrimoScreen> {
  final TextEditingController _number1=TextEditingController();
  bool _status=false;
  void _checked(){

      _status=true;
    try{
      int n=int.parse(_number1.text);
      for(int i=2;i<n;i++){
        if(n%i==0){
          _status=false;
        }
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
      title: 'Numero Primo',
      contenido:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFieldWidgetInt(
              label: 'Ingrese un numero', 
              number1: _number1
              ),
              FilledButton(
                onPressed: _checked, 
                child: Text('Verificar')
                ),
                Text((_status?'El numero es primo':'El numero no es primo'))
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check),
              Text('Aceptar')
            ],
          )
          )
      ],
    );
  }
  );
}