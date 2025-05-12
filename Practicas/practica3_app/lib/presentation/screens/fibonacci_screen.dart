import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  String _result='';
  void _calcul(String n){
    try{
      int a=-1,b=1,c=0;
      int num=int.parse(n);
      for(int i=0;i<num;i++){
        c=a+b;
        a=b;
        b=c;
        _result+= ' $c ';
      }

    }catch(e){
      _result= 'Ingrese un dato valido';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Fibonacci',
      contenido: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  onChanged: (value){
                    setState(() {
                      if(value!=''){
                        _result='';
                        _calcul(value);
                        setState(() {
                          
                        });

                      }
                      else{
                        _result='';
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Ingrese un numero',
                    fillColor: const Color.fromARGB(255, 219, 233, 249),
                    filled: true,
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                    
                  ),
                
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                Text(_result,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 4, 33, 75)
                ),)
          ],
        ),
      ), 
      );
  }
}