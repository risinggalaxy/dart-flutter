import 'package:characters/characters.dart';

// Challenge: Write a ransom note by cutting letters out of the available
// magazines and pasting them together to form a letter. Given an arbitrary
// ransom note string and another string containing all the contents of all
// the magazines, write a function that will return true if the ransom
// note can be made from the magazines; otherwise, it will return false.
// Every letter found in the magazine string can only be used once in your
// ransom note.
// Assumption: We don't need to count spaces in our note
//
// This is basically an exercise in counting and book keeping.
//
// If we can count the number of times a letter appears in the ransom note,
// and then compare it with the number of times it appears in the letters,
// we can tell if the ransom note can be written.

void main() {
  bool ransom = isRansom('HeLlO        World','dlroWolleH');
  bool notRansom = isRansom('Welcome To My Git Hub','WelcomeToMyGtHub');
  print(ransom);
  print(notRansom);
}

bool isRansom(String note, String ransom) {
  Map<String,int> nMap = map(note.replaceAll(' ', ''));
  Map<String,int> rMap = map(ransom.replaceAll(' ', ''));
  for(String key in nMap.keys ){
    if(rMap[key] == null) { return false;}
    if(rMap[key]! < nMap[key]!){ return false; }
  }
  return true;
}

Map<String,int> map(String value) {
  Map<String,int> m = {};
  List<String> chars = value.toLowerCase().characters.toList();
  for(String char in chars){
    if(m[char] != null){ m[char] = m[char]! + 1;}
    m[char] = 1;
  }
  return m;
}
