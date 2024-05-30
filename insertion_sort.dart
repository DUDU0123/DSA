void main() {
  List<int> list = [2, 34, 5, 6, 8, 66, 92, 14];
  insertionSort(list: list);
}

insertionSort({required List<int> list}) {
  int temp;
  for (var i = 1; i < list.length; i++) {
    temp = list[i];
    int j = i - 1;
    while (j >= 0 && list[j] > temp) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = temp;
  }
}
