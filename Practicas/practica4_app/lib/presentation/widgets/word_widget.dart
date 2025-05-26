import 'package:flutter/material.dart';
import 'package:practica4_app/presentation/providers/character_provider.dart';
import 'package:provider/provider.dart';
class WordWidget extends StatelessWidget {
  final int index;
  const WordWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
        final characterProvider =context.watch<CharacterProvider>();
    return SizedBox(
                      width: 40,
                      height: 40,
                      child: FilledButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )
                          )
                        ),
                        onPressed: null, 
                        child: Text(
                          characterProvider.word[index],
                          style: TextStyle(
                            fontSize: 28,
                            color: characterProvider.word[index]!='?'?Colors.green[700]:Colors.black45,
                          ),
                          ))
                    );
  }
}