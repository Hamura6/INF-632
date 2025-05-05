import 'package:ecotips_app/config/helpers/get_categories.dart';
import 'package:flutter/material.dart';

class CardCategories extends StatelessWidget {
  final int id;
  const CardCategories({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    //obtener la categoria mediante el id que llega por el constructor
    final item=GetCategories().find(id);
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 5),
      child: Card(
        color: Colors.black54,
        //agregar animacion hero
        child: Hero(
          //proporcionar el identificador en dinamico para vincular los widgets
          tag: 'images-${id}',
          child: Container(
            padding: EdgeInsets.all(2),
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            //Agregar una imagen de fondo en el container
              image: DecorationImage(
                //proporsinar la imagen 
                image: AssetImage(item.image),
                fit: BoxFit.fill,
                //agregar filtro de color oscuro
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 0,
                    children: [
                      Text(
                        maxLines: 2,
                        item.title,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: const Color(0xFFEEEDED),
                          fontSize: 20,
                          decorationColor: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: const Color.fromARGB(255, 165, 165, 165),
                          ),
                          FilledButton(
                            //indicar la ruta a donde se desplazara y enviar la posicion como argumento
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/detailPage',
                                arguments: id,
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                               Color.fromARGB(255, 17, 77, 126),
                              ),
                              //definir tamaño minimo del boton
                                minimumSize: MaterialStateProperty.all(Size.zero),
                                //agregar espaciado interno del boton
                                padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.remove_red_eye, color: const Color.fromARGB(255, 222, 222, 222)),
                                Text(
                                  'Ver mas',
                                  style: TextStyle(color: const Color.fromARGB(255, 217, 217, 217)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
