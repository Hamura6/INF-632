import 'package:flutter/material.dart';
class ItemDrawer extends StatelessWidget {
  final String route;
  final String name;
  final IconData icons;
  const ItemDrawer({super.key, required this.route, required this.name, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        textColor: const Color.fromARGB(255, 4, 34, 75),
        iconColor: Colors.white,
        
        leading: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color:const Color.fromARGB(172, 4, 34, 75),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Icon(
            icons),
        ),
        title: Text(name
        ),
        onTap: (){
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}