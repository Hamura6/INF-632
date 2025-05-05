import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    //agregar imagen de fondo en la pantalla
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                //proporsionar imagen
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
                //agregar filtro opacidad en la imagen
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken)
                )
            ),
          );
  }
}