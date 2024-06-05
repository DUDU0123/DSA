void main() {
  List<int> list = [10, 2, 33, 25, 67, 82, 3536, 38, 928, 77, 98];
  list.sort();
  print(list);
  int value = binarySearch(list, 33);
  print("Element found at index : $value");
}

// void main() {
//   List<int> list = [10, 20, 30, 10, 45, 45];
//   list = removeDuplicates(list: list);
//   print(list);
// }

// List<int> removeDuplicates({required List<int> list}) {
//   Set<int> set = {};
//   for (int i = 0; i < list.length; i++) {
//     if (!set.contains(list[i])) {
//       set.add(list[i]);
//     }
//     set.add(list[i]);
//   }
//   return set.toList();
// }

// int binarySearch({
//   required List<int> list,
//   required int target,
//   required int start,
//   required int end,
// }) {

//   int mid = start + (end - start) ~/ 2;
//   if (target==list[mid]) {
//     return mid;
//   }
//   if (target < list[mid]) {
//     return binarySearch(
//       list: list,
//       target: target,
//       start: start,
//       end: mid - 1,
//     );
//   }
//   if (target > list[mid]) {
//     return binarySearch(
//       list: list,
//       target: target,
//       start: mid + 1,
//       end: end,
//     );
//   }
//   throw ArgumentError('No Value found');
// }

int binarySearch(List<int> list, int target) {
  int start = 0;
  int end = list.length - 1;

  while (start <= end) {
    int mid = start + (end - start) ~/ 2;

    if (list[mid] == target) {
      return mid; // Element found
    } else if (target > list[mid]) {
      start = mid + 1; // Search in the right half
    } else {
      end = mid - 1; // Search in the left half
    }
  }

  return -1; // Element not found
}
