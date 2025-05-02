import 'package:flutter/material.dart';
class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;
  const DrawerItem({super.key, required this.icon, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19)
        ),
                leading: Icon(icon,color: Colors.white,),
                title: Text(text ,style: TextStyle(fontSize: 20,color:Colors.white70),),
                onTap: (){
                  Navigator.pushReplacementNamed(context, route);
                },
              ),
    );
  }
}