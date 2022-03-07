import 'package:characters/characters.dart';
/*
 // Challenge: Given a string with repeating characters (i.e. "aaabb") write
 // an algorithm that will compress the string down to the character, followed
 // by the number of times it appears in the string (i.e "a3b2").
 // If the compressed string is not smaller than original, return original.
 */
void main() {
  print(compress('aaabb')); // a3b2
  print(compress('vi')); // vi
  print(compress('ab')); // ab
  print(compress('xxxyy')); // x3y2
  print(compress('zzz')); //z3
  print(compress('aaabbbbccsssd')); //a3b4c2s3d1
}

String compress(String s) {
  String compressed = '';
  List<String> chars = s.characters.toList();
  int count = 0;
  int n = 0;
  for (int i = 0; i < s.length; i++) {
    count++;
    if (n + 1 >= s.length || chars[n] != chars[n + 1]) {
      compressed += chars[n];
      compressed += '$count';
      count = 0;
    }
    n++;
  }
  return compressed.length < s.length ? compressed : s ;
}
