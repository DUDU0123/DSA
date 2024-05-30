class MinHeap {
  List<int> array = [];
  MinHeap() {}

  MinHeap.another({required List<int> arr}) {
    buildHeap(arr: arr);
  }

  parent({required int index}) {
    return (index - 1) ~/ 2;
  }

  left({required int index}) {
    return (2 * index) + 1;
  }

  right({required int index}) {
    return (2 * index) + 2;
  }

  buildHeap({required List<int> arr}) {
    array = arr;
    for (var i = parent(index: array.length - 1); i >= 0; i--) {
      shiftDown(index: i);
    }
  }

  shiftDown({required int index}) {
    int parentIndex = index;
    int leftIndex = left(index: parentIndex);
    int endIndex = array.length - 1;
    while (leftIndex <= endIndex) {
      int rightIndex = right(index: parentIndex);
      int indexToShift;
      if (rightIndex <= endIndex && array[rightIndex] < array[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }

      if (array[parentIndex] > array[indexToShift]) {
        int temp = array[parentIndex];
        array[parentIndex] = array[indexToShift];
        array[indexToShift] = temp;
        parentIndex = indexToShift;
        leftIndex = left(index: parentIndex);
      } else {
        return;
      }
    }
  }

  shiftUp({required int index}) {
    int parentIndex = parent(index: index);
    while (index > 0 && array[parentIndex] > array[index]) {
      int temp = array[parentIndex];
      array[parentIndex] = array[index];
      array[index] = temp;
      index = parentIndex;
      parentIndex = parent(index: index);
    }
  }

  peek() {
    return array[0];
  }

  remove() {
    int temp = array[0];
    array[0] = array[array.length - 1];
    array[array.length - 1] = temp;
    array.removeAt(array.length - 1);
    shiftDown(index: 0);
  }

  insert({required int value}) {
    array.add(value);
    shiftUp(index: array.length - 1);
  }

  display() {
    for (var element in array) {
      print(element);
    }
  }
}

class MaxHeap {
  List<int> array = [];
  MaxHeap() {}
  MaxHeap.another({required List<int> arr}) {
    buildHeap(arr: arr);
  }

  parent({required int index}) {
    return (index - 1) ~/ 2;
  }

  left({required int index}) {
    return (2 * index) + 1;
  }

  right({required int index}) {
    return (2 * index) + 2;
  }

  buildHeap({required List<int> arr}) {
    array = arr;
    for (var i = parent(index: array.length - 1); i >= 0; i--) {
      shiftDown(index: i);
    }
  }

  shiftDown({required int index}) {
    int parentIndex = index;
    int leftIndex = left(index: parentIndex);
    int endIndex = array.length - 1;
    while (leftIndex <= endIndex) {
      int rightIndex = right(index: parentIndex);
      int indexToShift;
      if (rightIndex <= endIndex && array[rightIndex] > array[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }

      if (array[parentIndex] < array[indexToShift]) {
        int temp = array[parentIndex];
        array[parentIndex] = array[indexToShift];
        array[indexToShift] = temp;
        parentIndex = indexToShift;
        leftIndex = left(index: parentIndex);
      } else {
        return;
      }
    }
  }

  shiftUp({required int lastIndex}) {
    int parentIndex = parent(index: lastIndex);
    while (lastIndex > 0 && array[parentIndex] < array[lastIndex]) {
      int temp = array[parentIndex];
      array[parentIndex] = array[lastIndex];
      array[lastIndex] = temp;
      lastIndex = parentIndex;
      parentIndex = parent(index: lastIndex);
    }
  }

  peek() {
    return array[0];
  }

  remove() {
    int temp = array[0];
    array[0] = array[array.length-1];
    array[array.length-1] = temp;
    array.removeAt(array.length -1);
    shiftDown(index: 0);
  }

  insert({required int value}) {
    array.add(value);
    shiftUp(lastIndex: array.length-1);
  }

  display() {
    for (var element in array) {
      print(element);
    }
  }
}

void main() {
  // MinHeap minHeap = MinHeap.another(arr: [
  //   10,
  //   3,
  //   5,
  //   8,
  //   9,
  // ]);
  // minHeap.remove();

  // minHeap.insert(value: 20);
  // print(minHeap.peek());
  // minHeap.display();
  MaxHeap maxHeap = MaxHeap.another(arr: [
    10,
    3,
    5,
    8,
    9,
    
  ]);
  //maxHeap.remove();

  maxHeap.insert(value: 20);
 // print(maxHeap.peek());
  maxHeap.display();
}
