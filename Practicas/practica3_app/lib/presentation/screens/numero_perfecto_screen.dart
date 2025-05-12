import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class NumeroPerfectoScreen extends StatefulWidget {
  const NumeroPerfectoScreen({super.key});

  @override
  State<NumeroPerfectoScreen> createState() => _NumeroPerfectoScreenState();
}

class _NumeroPerfectoScreenState extends State<NumeroPerfectoScreen> {
  final TextEditingController _number=TextEditingController();
  bool _isPerfect=false;
  void _checked(){
    int result=0;
    try{
    int num=int.parse(_number.text);
    for(int i=1;i<num;i++){
      if(num%i==0){
        result+=i;
      }
    }
    _isPerfect=num==result?true:false;
    }catch(e){
      _mostrar(context);
    }
    
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Numero Perfecto',
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
                onPressed: _checked, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calculate),
                    Text('Verificar')
                  ],
                )
                ),
                Text(_isPerfect?'El numero es perfecto':'El numero no se perfecto')
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