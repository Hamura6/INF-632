import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3_app/presentation/widgets/layout.dart';
class FactorialScreen extends StatefulWidget {
  const FactorialScreen({super.key});

  @override
  State<FactorialScreen> createState() => _FactorialScreenState();
}

class _FactorialScreenState extends State<FactorialScreen> {
  String _response='';
  int _factorial(String num){
      int n=int.parse(num);
      int total=1;
      for(int i=1;i<=n;i++){
        total*=i;
      }
      return total;
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Factorial',
      contenido: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          children: [
            TextField(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  onChanged: (value){
                    setState(() {
                      if(value!=''){
                        _response='El factorial de ${value} es ${_factorial(value)}';

                      }
                      else{
                        _response='';
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
                Text(_response,
                style: TextStyle(
                  color: const Color.fromARGB(255, 4, 33, 75),
                  fontSize: 20
                ),
                
                ),
                
          ],
        ),
      ), 
      );
  }
}