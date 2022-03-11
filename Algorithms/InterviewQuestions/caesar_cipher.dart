/*
// Caesar Cipher.
// A Caesar Cipher is a basic encryption algorithm that takes all the letters message
// and encrypts them by shifting them over some fixed amount.
//
// For example a Caesar Cipher of x23 would map the alphabet like this:
//
// Input:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
// Output:   XYZABCDEFGHIJKLMNOPQRSTUVW
//
// And the following text like this:
//
// Plaintext:  HELLO WORLD, GREETINGS FROM RISING GALAXY
// Encrypted: EBIIL TLOIAW DOBBQFKDP COLJ OFPFKD DXIXUV
//
// Write an encrypt and decrypt method of a Caesar Cipher using an offset of 23
//
 */

import 'package:characters/characters.dart';

//Main function
void main() {
  CaesarCipher ccipher = CaesarCipher('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
  String encrypt = ccipher.encryption('HELLO WORLD, GREETINGS FROM RISING GALAXY', 23, Encryption.encrypt);
  String decrypt = ccipher.encryption('EBIIL TLOIAW DOBBQFKDP COLJ OFPFKD DXIXUV', 23, Encryption.decrypt);
  print(encrypt);
  print(decrypt);
}

//Enumeration
enum Encryption { encrypt, decrypt }

// CaesarCipher Class
class CaesarCipher {
  final String _alphabet;
  CaesarCipher(this._alphabet);
  String encryption(String message, int n, Encryption mode) {
    String result = '';
    List<String> messageChars = message.characters.toList();
    List<String> lookup = _alphabet.characters.toList();
    for (String char in messageChars) {
      String chars = '';
      if (char != ' ') {
        int x = lookup.indexOf(char);
        int key;
        switch (mode) {
          case Encryption.encrypt: key = (x + n) % _alphabet.length; break;
          case Encryption.decrypt: key = (x - n) % _alphabet.length; break; }
          chars += _alphabet[key.abs()].toString();
      } else { chars += ' '; } result += chars; } return result; }
}
