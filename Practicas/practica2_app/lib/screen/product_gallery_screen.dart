import 'package:flutter/material.dart';
import 'package:practica2_app/config/helpers/get_platos.dart';
import 'package:practica2_app/widgets/custom_drawer.dart';
class ProductGalleryScreen extends StatelessWidget {
  const ProductGalleryScreen({super.key});
  @override
  Widget build(BuildContext context) {
  final listPlatos=GetPlatos().get();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Galeria de productos'),
         backgroundColor: const Color(0xFF032A4A),
         foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 7,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7
            ), 
            itemCount:7 ,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  _mostrarSnackBar(context,listPlatos[index].name);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: Offset(1, 5)
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              listPlatos[index].images,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              ),
                          ),
                        ),
                        Text(
                          listPlatos[index].name,
                          style: TextStyle(
                            color: const Color(0xFF032A4A),
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Precio',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            Text(
                              '${listPlatos[index].price} Bs',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 191, 192, 193),
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
          }
          ),
      ),
    );
  }
  
  void _mostrarSnackBar(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name agotado'),
        duration: Duration(seconds: 3),
        )
    );
  }
}