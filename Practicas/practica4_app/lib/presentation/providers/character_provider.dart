import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practica4_app/config/helpers/get_character.dart';
import 'package:practica4_app/infrastructure/models/character.dart';

class CharacterProvider extends ChangeNotifier{
  List<int> _listHits=[];
  final List<Character> _getCharacter=GetCharacter().get();
  int _count=0;
  int __level=1;
  final Random rm=Random();
  Character _character=Character(name: 'No encontrado', image: 'Vista');
  List<String> _word=[];


  CharacterProvider(){
    int index=rm.nextInt(_getCharacter.length);
    index=rm.nextInt(_getCharacter.length);
    _character=_getCharacter[index];
    _word=List.filled(_character.name.length, '?');
    _listHits.add(index);
  }
  int get count=>_count;
  int get level=>__level;
  String get character=>_character.name;
  String get image=>_character.image;
  List<String> get letter=>_character.letter;
  List<String> get word=>_word;

  void verification(String text){
    bool statu=false;
    if(character.contains(text)){
      for(int i=0;i<character.length;i++){
        if(character[i]==text && _word[i]=='?'){
          _word[i]=text;
          statu=true;
          break;
        }
      }
      if(!statu){
        _count++;
      }
      if(character==_word.join()){
        __level++;
        int index=rm.nextInt(_getCharacter.length);
        while(true){
          if(_listHits.contains(index)){
            index=rm.nextInt(_getCharacter.length);
          }else{
            break;
          }
        }
        _listHits.add(index);
        _character=_getCharacter[index];
         _word=List.filled(_character.name.length, '?');
      }
        
    }else{
      _count++;
    }
    notifyListeners();
  }
  void reset(){
        __level=1;
        _count=0;
        _listHits.clear();
        int index=rm.nextInt(_getCharacter.length);
        _listHits.add(index);
        _character=_getCharacter[index];
         _word=List.filled(_character.name.length, '?');
         notifyListeners();
  }

}
