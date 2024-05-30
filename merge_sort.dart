void main() {
  List list = [10, 2, 33, 25, 67, 82, 3536, 38, 928, 77, 98];
  divideAndMergeSort(list: list, start: 0, end: list.length-1);
  print(list);
}

divideAndMergeSort({
  required List list,
  required int start,
  required int end,
}) {
  if (start < end) {
    int mid = start + (end - start) ~/ 2;
    divideAndMergeSort(list: list, start: start, end: mid);
    divideAndMergeSort(list: list, start: mid + 1, end: end);
    mergeSort(list: list, mid: mid, start: start, end: end);
  }
}

mergeSort({
  required List list,
  required int mid,
  required int start,
  required int end,
}) {
  int i = start;
  int j = mid + 1;
  int k = start;
  List newList = List.filled(end - start + 1, 0);
  while (i <= mid && j <= end) {
    if (list[i] < list[j]) {
      newList[k - start] = list[i];
      i++;
    } else {
      newList[k - start] = list[j];
      j++;
    }
    k++;
  }

  if (i > mid) {
    while (j <= end) {
      newList[k - start] = list[j];
      j++;
      k++;
    }
  }else{
    while (i<=mid) {
      newList[k-start] = list[i];
      i++;
      k++;
    }
  }

  for (var i = start; i <= end; i++) {
    list[i] = newList[i-start];
  }
}
