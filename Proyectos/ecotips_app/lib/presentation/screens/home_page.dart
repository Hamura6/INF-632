import 'package:ecotips_app/presentation/widgets/custom_drawer.dart';
import 'package:ecotips_app/presentation/widgets/background.dart';
import 'package:ecotips_app/presentation/widgets/card_categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Permite que el body se dibuje detrás del AppBar
      extendBodyBehindAppBar:true, 
      appBar: AppBar(
        //agregar borde en la parte izquierda y derecha de abajo del appbar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('EcoTips'),
            Icon(Icons.search)
          ],
        ),
        backgroundColor:Colors.black.withOpacity(0.55),  // Hace transparente el AppBar
        
      ),
      //LLamada del widget del menu lateral
      drawer: CustomDrawer(),
      //agregar el widget que sobre pones los elementos encima de otros
      body: Stack(
        children: [
          // llama da al widget para la imagen de fondo
         Background(),

          // Contenido encima de la imagen
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    //ktoolbarheight hace referencia al alto del encabezado al appbar 
                    height: kToolbarHeight + 30,
                  ), // espacio debajo del AppBar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      
                      children: [
                        Icon(Icons.type_specimen,
                        color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Categorias',
                          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30),
                        ),
                      ],
                    ),
                  ),//
                   ListView.builder(
                    padding:EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,  
                      itemBuilder: (context, index) {
                        //llamada del widget para mostrar las cards dentro del listview
                        return  CardCategories(id: index);
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
