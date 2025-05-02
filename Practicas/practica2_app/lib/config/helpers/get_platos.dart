import 'package:practica2_app/domain/entities/platos.dart';

class GetPlatos {
  Platos p1=Platos(
   name: 'Picante de pollo',
   images: 'assets/images/r1.jpg',
   price: 12.50,
   value: 3);
  Platos p2=Platos(
   name: 'Mondongo',
   images: 'assets/images/r2.jpg',
   price: 20.00,
   value: 4);
  Platos p3=Platos(
   name: 'Cerdo al horno',
   images: 'assets/images/r3.jpg',
   price: 30.50,
   value: 3);
  Platos p4=Platos(
   name: 'Lazaña',
   images: 'assets/images/r4.png',
   price: 70,
   value: 5);
  Platos p5=Platos(
   name: 'Pan queque',
   images: 'assets/images/r5.png',
   price: 3,
   value: 3);
  Platos p6=Platos(
   name: 'Buñuelo',
   images: 'assets/images/r6.png',
   price: 3.5,
   value:1);
  Platos p7=Platos(
   name: 'Aji de fideo',
   images: 'assets/images/r7.png',
   price: 10,
   value: 4);
   List<Platos> listPlatos=[];
   GetPlatos(){
    listPlatos=[p1,p2,p3,p4,p5,p6,p7];
   }
   List<Platos> get(){
    return listPlatos;
   }
}
