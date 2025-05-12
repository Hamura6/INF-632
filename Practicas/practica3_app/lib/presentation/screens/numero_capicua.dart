import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class NumeroCapicua extends StatefulWidget {
  const NumeroCapicua({super.key});

  @override
  State<NumeroCapicua> createState() => _NumeroCapicuaState();
}

class _NumeroCapicuaState extends State<NumeroCapicua> {
  final TextEditingController _number1=TextEditingController();
  String _result='';
  void isCapicua(){
    setState(() {
      
    });
    try{
      String cadena=_number1.text.split('').reversed.join();
      if(cadena==_number1.text){
        _result='Si es un numero capicua';
      }else{
        _result='No es un numero capicua';
      }
    }catch(e){
      _mostrar(context);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numero Capicua'),
         backgroundColor: const Color.fromARGB(255, 4, 33, 75),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 10,
            children: [
              TextFieldWidgetInt(label: 'Ingrese un numero', number1: _number1),
              FilledButton(
                onPressed: (){
                  isCapicua();
                }, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.analytics),
                    Text('Verificar')
                  ],
                )),
                Text(_result,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 4, 33, 75)
                ),
                )
            ],
          ),
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
        content:Text('Ingrese un numero valido'),
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