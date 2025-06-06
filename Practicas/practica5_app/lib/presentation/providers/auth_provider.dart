import 'package:flutter/material.dart';
import 'package:practica5_app/config/helpers/get_users.dart';
import 'package:practica5_app/presentation/screens/home_screen.dart';
class AuthProvider extends ChangeNotifier{
 final List<String> _listUser=GetUsers().users;
 String? _user;
 get user=>_user;
void verification(String name,BuildContext context){
  if(_listUser.contains(name)){
    _user=name;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  else{
    showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text('No valido'),
      content: Text('Usuario invalido'),
      actions: [
        FilledButton(onPressed: (){
          Navigator.pop(context);
        }, child:Text('Aceptar') )
      ],
    ));
    
  }
  notifyListeners();
  }   
}