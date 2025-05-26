import 'package:flutter/material.dart';
import 'package:practica4_app/presentation/providers/character_provider.dart';
import 'package:provider/provider.dart';
class LetterWidget extends StatelessWidget {
  final int index;
  const LetterWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
        final characterProvider =context.watch<CharacterProvider>();
    return SizedBox(
                      width: 55,
                      height: 50,
                      child: FilledButton(
                        onPressed: (){
                          characterProvider.verification(characterProvider.letter[index]);
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Text(
                          '${characterProvider.letter[index]}',
                          style: TextStyle(color: Colors.white,fontSize: 20,
                          
                          ),
                          ),
                        
                      ),
                    );
  }
}