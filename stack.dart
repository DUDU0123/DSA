class StackNode {
  int? data;
  StackNode? nextNode;
  StackNode({required this.data});
  StackNode.both({required this.data, required this.nextNode});
}

class Stack {
  StackNode? top;
  int? length;

  Stack() {
    this.length = 0;
  }

  display() {
    StackNode? node = top;
    while (node != null) {
      print(node);
      node.nextNode;
    }
  }

  peek() {
    if (top == null) {
      return;
    }
    return top?.data;
  }

  push({required int data}) {
    StackNode node = StackNode(data: data);
    if (top == null) {
      top = node;
    } else {
      node.nextNode = top;
      top = node;
    }
    length = length! + 1;
  }

  pop() {
    if (top == null) {
      return;
    }

    top = top?.nextNode;
    length = length! - 1;
  }

  isEmpty() {
    return length == 0;
  }
}

void main() {
  Stack st = Stack();
  st.push(data: 10);
  st.push(data: 11);
  st.push(data: 3);
  st.push(data: 5);
  st.push(data: 6);
  st.display();
}
