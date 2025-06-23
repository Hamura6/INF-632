import 'package:flutter/material.dart';
import 'package:practica6_app/providers/menu_provider.dart';
import 'package:practica6_app/providers/transaccion_provider.dart';
import 'package:provider/provider.dart';
class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {

              
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bienvenido',
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                  )
                ],
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _items({"text":"Inicio","icon":Icon(Icons.home),"ruta":"/","argumento":null}, context),
                  _items({"text":"Historial","icon":Icon(Icons.history),"ruta":"historial","argumento":null}, context),
                  _items({"text":"Trasacciones","icon":Icon(Icons.transcribe),"ruta":"transaccion","argumento":"si"}, context),
                  _items({"text":"Fitros","icon":Icon(Icons.filter_tilt_shift),"ruta":"filtros","argumento":null}, context)
                ],
              )
              )
        ],
      ),
    );
  }

 
 Widget _items(Map data, BuildContext context) {
  if(data["argumento"]=="si"){
     
     return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
                    title: Text(data['text'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[900]),),
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:Container(
              padding: EdgeInsets.all(5),
              color: Colors.blue[100],
              child:data["icon"] ,
            ) 
          ) ,
          onTap: (){
            TransaccionProvider provider=context.read<TransaccionProvider>();
              provider.clearProvider();
              Navigator.pushNamed(context,'transaccion', arguments: provider);
          },
        );
  }else{
    return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          title: Text(data['text'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[900]),),
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:Container(
              padding: EdgeInsets.all(5),
              color: Colors.blue[100],
              child:data["icon"] ,
            ) 
          ) ,
          onTap: (){
            Navigator.pushNamed(context, data['ruta']);
          },
        );

  }
    
 }
}