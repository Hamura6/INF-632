import 'package:flutter/material.dart';
class SumaScreen extends StatefulWidget {
  const SumaScreen({super.key});

  @override
  State<SumaScreen> createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  final TextEditingController _numero1=TextEditingController();
  final TextEditingController _numero2=TextEditingController();
  int _resul=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)
          )
        ),
        backgroundColor: Colors.lightBlue[900],
        foregroundColor: Colors.white,
        title: Text('Sumar dos numeros'),
        
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color:Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingrese un numero' ,textAlign: TextAlign.start,),
            TextField(
              controller: _numero1,
              decoration: InputDecoration(
                hintText: 'Ej. 50'
              ),
            ),
            Text('Ingrese un numero'),
            TextField(
              controller: _numero2,
              decoration: InputDecoration(
                hintText: 'Ej. 81'
              ),
            ),
            Padding(
              
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    _resul=int.parse(_numero1.text)+int.parse(_numero2.text);
                  });
                
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.lightBlue[900]),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Text('Calcular')),
              ),
            ),
            Text('Resultado ${_resul}',style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}