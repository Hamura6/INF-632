import 'package:ecotips_app/config/helpers/get_categories.dart';
import 'package:ecotips_app/presentation/widgets/custom_drawer.dart';
import 'package:ecotips_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //obteniendo la posicion de la categoria por medio de los argumentos
    final int id=ModalRoute.of(context)?.settings.arguments as int;
    //obtener la categoria por medio de la posicion
    final item=GetCategories().find(id);
    return Scaffold(
      //llamada al widget del menu lateral
      drawer: CustomDrawer(),
      //permitir que el body se dibuje detras del appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //proporsionar bordes a la izquierda y deracha de la parte de bajo del appbar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        foregroundColor: Colors.white,
        title: Text(item.type,),
        //porporcionar una color de fondo negro con opacidad de 50%
        backgroundColor:Colors.black.withOpacity(0.55), 
      ),
      body: Stack(
        children: [
          //agregar el widget de imagne de fondo para el body
          Background(),
          //propocionar un solo scroll para todo el contenido
          SingleChildScrollView(
            padding: EdgeInsets.only(top:100,right: 10,left: 10,bottom: 15),
            child:  Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  //agregar sombra en el container 
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.55),
                      blurRadius: 8,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal,
                      offset: Offset.zero
                    )
                  ],
                  //agregar bordes redondeados en el container
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 7,left: 7,bottom: 30),
                  child: Column(
                    children: [
                      //mostrar el titulo de la categoria
                      Text(item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                      
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          //agregar la animacion hero y el identificar para vincular los widgets
                          child: Hero(
                            tag: 'images-${id}',
                            //proporcionar la imagen de la categoria
                            child: Image.asset(
                              item.image,
                              height: 350,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //mostrar la descripcion de la categoria
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.justify,
                          ),
                      )
                    ],
                  ),
                )
                ),
            )
        ],
      ),
      //agregar boton flotante para regresar al a ventana anterior
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back,color: Colors.white,),
    backgroundColor: Color.fromARGB(255, 17, 77, 126),
    ),
    );
  }
}