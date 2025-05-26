  import 'package:flutter/material.dart';
import 'package:practica4_app/presentation/providers/character_provider.dart';
import 'package:practica4_app/presentation/widgets/letter_widget.dart';
import 'package:practica4_app/presentation/widgets/word_widget.dart';
import 'package:provider/provider.dart';
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterProvider =context.watch<CharacterProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          color: Colors.amber[50],
                          child: Row(
                            spacing: 3,
                              children: [
                                Icon(
                                  Icons.shield,
                                  color: Colors.amber[600],
                                  size: 16,
                                  ),
                                Text(
                                  'Intentos',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16
                                  ),
                                  ),
                                Text(
                                  '${9-characterProvider.count}',
                                  style: TextStyle(
                                    color: Colors.amber[600],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ) 
                              ],
                            ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          color: Colors.teal[50],
                          child: Row(
                            spacing: 3,
                              children: [
                                
                                  Text(
                                  'Nivel',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16
                                  ),
                                  ),
                               Text(
                                  '${characterProvider.level}',
                                  style: TextStyle(
                                    color: Colors.teal[600],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                               )
                                
                                
                              ],
                            ),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/${characterProvider.count}.png',
                  height: 250,
                  width: 270,
                  fit:BoxFit.fill,
                  ),
                if(characterProvider.count<9 && characterProvider.level<=7)
                Column(
                  spacing: 20,
                  children: [
                    Wrap(
                  direction: Axis.horizontal,
                  spacing: 1.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.start,
                  children: [
                    for(int i=0;i<characterProvider.word.length;i++)
                      WordWidget(index: i)
                  ],
                ),
                    Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    for(int i=0;i<characterProvider.letter.length;i++)
                      LetterWidget(index:i),
                  ],
        
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(characterProvider.image,
                    height: 320,
                    width: double.infinity,
                    fit:BoxFit.fill,
                    ),
                ),
        
                  ],
                )else if(characterProvider.count>=9)
                Column(
                  children: [
                    Image.asset(
                      'assets/images/over.jpg',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.fill,
                      ),
                    Text('El personaje era ${characterProvider.character}',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold

                    ),
                    )
        
                  ],
                ),
                if(characterProvider.level>7)
                Column(
                  children: [
                     Image.asset(
                        'assets/images/win.png',
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.fill,
                        
                    ),
                    Text('Ganaste el juego',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold

                    ),
                    )
        
                  ],
                )
        
                
              ],
            ),
          ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){characterProvider.reset();}, 
          child: Icon(Icons.restart_alt),
        ),
    );
  }
}