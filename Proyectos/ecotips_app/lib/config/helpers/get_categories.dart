import 'package:ecotips_app/domain/entities/categories.dart';

class GetCategories {
  final c1=Categories(
    type:'Reciclajes',
    title: 'Separa tus residuos en organicos e inorganicos',
   description: 'El reciclaje es uno de los procesos más importantes dentro del manejo sostenible de residuos. Consiste en transformar productos y materiales usados en nuevos insumos para la industria, reduciendo así la necesidad de extraer nuevos recursos naturales. Esta práctica forma parte del concepto de economía circular, que busca cerrar el ciclo de vida de los productos y minimizar los desechos.\nVivimos en una sociedad altamente consumista, donde la cultura del "usar y tirar" ha generado montañas de basura que no dejan de crecer. Los vertederos están saturados, los mares llenos de plástico, y muchos materiales que podrían reciclarse terminan contaminando el medio ambiente durante años o incluso siglos. El reciclaje se presenta como una solución accesible y efectiva para revertir esta situación.\nReciclar no sólo ayuda al planeta, sino también genera empleo, reduce costos de producción y fomenta una conciencia ambiental en la ciudadanía. Para que funcione, es clave una buena separación de residuos en el origen, es decir, desde nuestras casas, escuelas y lugares de trabajo.',
   image: 'assets/images/c11.jpg', 
   details: [
    {'Organicos:':' restos de comida, cáscaras, hojas secas. Son biodegradables y pueden convertirse en compost.'},
    {'No organicos:':'plásticos, metales, papel, cartón y vidrio. Estos materiales pueden reciclarse si se encuentran limpios y secos.'}
    ]);
  final c2=Categories(
    type:'Agua',
    title: 'Cierra el grifo mientras te lavas los dientes',
   description: 'El agua es un recurso vital para la existencia de todas las formas de vida, pero también es finito y vulnerable. Aunque el planeta está cubierto en su mayoría por agua, sólo un pequeño porcentaje es apto para el consumo humano. La contaminación de los cuerpos de agua, el cambio climático y el crecimiento urbano están poniendo en peligro este recurso esencial.\nEl acceso al agua potable es considerado un derecho humano fundamental. Sin embargo, millones de personas en todo el mundo aún carecen de este servicio. Además, muchas ciudades enfrentan sequías prolongadas, agotamiento de acuíferos y restricciones en el suministro debido al uso irresponsable del agua.\nUna práctica simple y efectiva es cerrar el grifo mientras te cepillas los dientes. Dejar el agua correr innecesariamente puede desperdiciar hasta 12 litros por minuto. Si consideramos que esta actividad se realiza dos o tres veces al día, el desperdicio anual es alarmante.',
   image: 'assets/images/c22.jpg', 
   details: []);
  final c3=Categories(
    type:'Energia',
    title: 'Usa bonbillas LED para ahorrar electricidad',
   description: 'La mayor parte de la energía que utilizamos en el mundo proviene de combustibles fósiles como el carbón, el petróleo y el gas natural. Estos recursos no solo son finitos, sino que también generan una gran cantidad de gases de efecto invernadero responsables del calentamiento global.\nLas consecuencias de este modelo energético son cada vez más evidentes: temperaturas extremas, huracanes, incendios forestales y derretimiento de los polos. Frente a esta realidad, es imprescindible avanzar hacia un sistema energético basado en fuentes limpias, sostenibles y renovables.\nUno de los cambios más fáciles de implementar en el hogar es sustituir las bombillas incandescentes por bombillas LED. Estas consumen hasta un 80% menos energía y duran hasta 25 veces más, lo que representa un doble beneficio: menor impacto ambiental y ahorro económico.',
   image: 'assets/images/c3.jpg', 
   details: []);
  List<Categories> listCategories=[];
   GetCategories(){
    listCategories=[c1,c2,c3];
   }
   List<Categories> get(){
    return listCategories;
   }
   Categories find(int id){
    return listCategories[id];
   }
}
