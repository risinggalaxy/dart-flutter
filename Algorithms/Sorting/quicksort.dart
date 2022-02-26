
void main() {
  
  List<int> myList = [100,300,40,50,12,2,4,5,190,18];
  List<int> sorted = quickSort(myList);
  print(sorted);
  
}

List<int> quickSort(List<int> arr ) {
  if (arr.length > 1) {
  List<int> lhs = [];
  List<int> rhs = [];
  List<int> equal = [];
  int pivot = arr[(arr.length ~/ 2)];
  for (var i = 0; i < arr.length; i++) {
    int value = arr[i];
    if (value < pivot) {
      lhs.add(value);
    } else if (value > pivot) {
      rhs.add(value);
    } else if (value == pivot ) {
      equal.add(value);
    }
  }
   return quickSort(lhs) + quickSort(equal) + quickSort(rhs);
  } else {
    return arr;
  }
}
