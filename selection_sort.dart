void main() {
  List<int> list = [2, 34, 5, 6, 8, 66, 92, 14];
  selectionSort(list: list);
}

selectionSort({required List<int> list}) {
  int temp;
  int min;
  for (var i = 1; i < list.length-1; i++) {
    min = i;
    for (var j = i+1; j < list.length-1-i; j++) {
      if(j>=0 && list[min]>list[j]){
        min = j;
      }
    }

    if (min!=i) {
      temp = list[i];
      list[i] = list[min];
      list[min] = temp;
    }
  }
}
