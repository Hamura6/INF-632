import 'package:flutter/material.dart';
import 'package:practica2_app/config/helpers/get_news.dart';
import 'package:practica2_app/widgets/custom_drawer.dart';
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listNews=GetNews().get();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 230, 230),
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Noticias'),
         backgroundColor: const Color(0xFF032A4A),
         foregroundColor: Colors.white,
      ),
      body:ListView.builder(
          itemCount: 7,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(177, 3, 42, 74),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(1, 4)
                    )
                  ]
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/details',arguments: index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            listNews[index].image,
                            height: 180,
                            width: 150,
                            fit: BoxFit.cover,
                            
                            ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  listNews[index].shortTitle,
                                  style: TextStyle(
                                    color: const Color(0xFF032A4A),
                                    fontSize: 18,
                                    
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.start,
                                  ),
                                Text(
                                  listNews[index].summary,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: const Color.fromARGB(160, 3, 42, 74)
                                  ),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );

          }
          ),
    );
  }
}