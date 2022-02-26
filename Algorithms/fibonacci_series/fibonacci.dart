void main() {
  int fibN = fibNaive(21);
  int fibSmart = fib(21);
  print(fibN);
  print(fibSmart);
  
}

int fibNaive(int n) {
    if (n == 0) {
      return n;
    } else if (n == 1) {
      return n;
    } else {
      return fibNaive(n - 1) + fibNaive(n - 2);
    }
  } 


Map<int, int> memoization = {};
int fib(int n) {
  if (n == 0) { return 0;}
  else if (n == 1) { return 1; }
  else {
    if (memoization[n] != null) {
      return memoization[n]!;
    }else {
     memoization[n] = fib(n - 1) + fib(n - 2);
    }
  }
  return memoization[n]!;
}
