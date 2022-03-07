import 'package:characters/characters.dart';
/*
 Given two strings, write a function to check if
 they are one or zero edits away.
 */
void main() {
  bool first = oneAwayCheck('back','bac');
  print(first);//true
  bool second = oneAwayCheck('back','baek');
  print(second); //true
  bool third = oneAwayCheck('backto','bac');
  print(third); //false
}

bool oneAwayCheck( String f, String s ){
  if ((f.length - s.length).abs() > 1) { return false; }
  else if (f.length == s.length ) { return oneReplacement(f,s);}
  else if (f.length + 1 == s.length) { return oneInsert(f, s);}
  else if (f.length - 1 == s.length) { return oneInsert(f,s);}
  return true;
}

bool oneInsert(String f, String s) {
  int i = 0; int j = 0;
  List<String> fChars = f.characters.toList();
  List<String> sChars = s.characters.toList();
  while (i < fChars.length && j < sChars.length ) {
    if (fChars[i] != sChars[j]) {
      if (i != j) {return false;} j++;
    } else { i ++; j++; }
  }
  return true;
}

bool oneReplacement(String f, String s) {
  bool didFind = false;
  List<String> fChars = f.characters.toList();
  List<String> sChars = s.characters.toList();
  for (int i = 0; i < f.length; i++) {
    if (fChars[i] != sChars[i]) {
      if (didFind) { return false; }
      didFind = true;
    } } return true;
}
