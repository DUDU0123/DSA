void main() {
  List<int> list = [2, 34, 5, 6, 8, 66, 92, 14];
  bubbleSort(list: list);
}

bubbleSort({required List<int> list}) {
  int temp;
  bool isSorted;
  for (var i = 0; i < list.length - 1; i++) {
    isSorted = true;
    for (var j = 0; j < list.length - 1 - i; j++) {
      if (list[j] > list[j + 1]) {
        temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        isSorted = false;
      }
    }
    if (isSorted) {
      break;
    }
  }
}
