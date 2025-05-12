import 'package:flutter/material.dart';
import 'package:practica3_app/presentation/widgets/customer_drawer.dart';
import 'package:practica3_app/presentation/widgets/text_field_widget_int.dart';
class NumeroAmigoScreen extends StatefulWidget {
  const NumeroAmigoScreen({super.key});

  @override
  State<NumeroAmigoScreen> createState() => _NumeroAmigoScreenState();
}

class _NumeroAmigoScreenState extends State<NumeroAmigoScreen> {
  final TextEditingController _number1=TextEditingController();
  final TextEditingController _number2=TextEditingController();
  String _result='';
  void isFriendNumber(){
    try{
      int number1=int.parse(_number1.text);
      int number2=int.parse(_number2.text);
      
      if(total(number1)==number2 && total(number2)==number1){
        _result='Los numeros son amigos';
      }else{
        _result='Los numero no son amigos';
      }
    }catch(e){
      _mostrar(context);
    }
    setState(() {
      });
  }
  int total(int n){
    int retult=0;
    for(int i=1;i<n;i++){
      if(n%i==0){
          retult+=i;
      }
    }
    return retult;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomerDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 33, 75),
        foregroundColor: Colors.white,
        title: Text('Numeros amigos'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 12,
            children: [
              TextFieldWidgetInt(label: 'Ingrese un numero', number1: _number1),
              TextFieldWidgetInt(label: 'Ingrese un numero', number1: _number2),
               FilledButton(
                  onPressed: (){
                    isFriendNumber();
                  }, 
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.functions),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Calcular'),
                    ],
                  )
                  ),
              Text(_result,
              style: TextStyle(
                color: const Color.fromARGB(255, 3, 68, 141),
                fontSize: 20
              ),
              )
          
            ],
          ),
        ),
      )
    );
  }
}
void _mostrar(context){
    showDialog(
  context: context, 
  builder: (BuildContext context){
    return AlertDialog(
      title: Text('Error'),
      content: Text('Ingrese un numero valido'),
      alignment: Alignment.topCenter,
      actions: [
        FilledButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Row(
            children: [
              Icon(Icons.check),
              Text('Aceptar')
            ],
          )
          ),
      ],
    );
  }
  );
}