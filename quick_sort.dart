void main() {
  List list = [10, 2, 33, 25, 67, 82, 3536, 38, 928, 77, 98];
  quickSort(list: list, start: 0, end: list.length - 1);
  print(list);
}

quickSort({required List list, required int start, required int end}) {
  if (start < end) {
    int pivotLocation = partition(list: list, start: start, end: end);
    quickSort(list: list, start: start, end: pivotLocation - 1);
    quickSort(list: list, start: pivotLocation + 1, end: end);
  }
}

//[2,4,5,6,8,9,7]
//pi

partition({
  required List list,
  required int start,
  required int end,
}) {
  int pivotLocation = list[start];
  int startPosition = start;
  int endPosition = end;
  int temp;

  while (startPosition < endPosition) {
    while (
        startPosition < endPosition && list[startPosition] <= pivotLocation) {
      startPosition++;
    }
    while (list[endPosition] > pivotLocation) {
      endPosition--;
    }

    if (startPosition < endPosition) {
      temp = list[startPosition];
      list[startPosition] = list[endPosition];
      list[endPosition] = temp;
    }
  }
  temp = list[start];
  list[start] = list[endPosition];
  list[endPosition] = temp;


  return endPosition;
}



// partition(
//     {required List list,
//     required int startPosition,
//     required int endPosition}) {
//   int pivot = list[startPosition];
//   int start = startPosition;
//   int end = endPosition;
//   int temp;
//   while (start < end) {
//     while (start < end && list[start] <= pivot) {
//       start++;
//     }

//     while (list[end] > pivot) {
//       end--;
//     }

//     if (start < end) {
//       temp = list[start];
//       list[start] = list[end];
//       list[end] = temp;
//     }
//   }

//   temp = list[startPosition];
//   list[startPosition] = list[end];
//   list[end] = temp;
//   return end;
// }