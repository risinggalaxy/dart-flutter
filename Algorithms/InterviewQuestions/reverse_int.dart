// Challenge: Given an int, reverse its digits.
// x = 123, return 321
// x= -123, return -321

void main() {
  print(reverse(123));
  print(reverse(-123));
  print(reverse(56789));
  print(reverse(-56789));
}

int reverse(int value) {
  bool isNegative = false;
  if(value < 0 ){ isNegative = true;}
  int x = value.abs();
  int reversed = 0;
  int lastDigit = 0;
  while(x >= 1) {
    lastDigit = x % 10;
    reversed = reversed * 10 + lastDigit;
    x = x ~/ 10;
  }
  return isNegative ? -reversed : reversed;
}
