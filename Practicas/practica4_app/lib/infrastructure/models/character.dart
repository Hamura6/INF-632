import 'dart:math';

class Character {
  final String name;
  final String image;
  List<String> letter=[];

  Character({required this.name, required this.image}) {

    List<String> alphabet = 'abcdefghijklmnopqrstuvwxz'.split('');
    letter=name.split('').toSet().toList();
    int count=(name.length*0.5).toInt();
    Random rm=Random();
    while(count>0){
      int index=rm.nextInt(alphabet.length);
      if(!letter.contains(alphabet[index])){
        count--;
        letter.add(alphabet[index]);
      }
    }
    letter.shuffle();
  }
}