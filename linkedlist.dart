class Node {
  int? data;
  Node? nextNode;
  Node({required this.data});
  Node.both({required this.data, required this.nextNode});
}

class LinkedList {
  Node? head;
  Node? tail;
  int? size;

  addNodeFirst({required int data}) {
    Node? node = Node(data: data);
    node.nextNode = head;
    head = node;
    if (tail == null) {
      tail = head;
    }
    if (size != null) size = size! + 1;
  }

  addNode({required int data}) {
    if (tail == null) {
      addNodeFirst(data: data);
      return;
    }
    Node node = Node(data: data);
    tail?.nextNode = node;
    tail = node;
    if (size != null) size = size! + 1;
  }

  addNodeBetween({required int data, required int index}) {
    if (index == 0) {
      addNodeFirst(data: data);
    }
    if (index == size) {
      addNode(data: data);
    }
    Node? headNode = head;

    for (var i = 1; i < index; i++) {
      headNode = headNode?.nextNode;
    }

    Node node = Node.both(data: data, nextNode: headNode?.nextNode);
    headNode?.nextNode = node;
    if (size != null) size = size! + 1;
  }

  display() {
    Node? node = head;
    print("Nodes");
    while (node != null) {
      print(node.data);
      node = node.nextNode;
    }
  }

  deletFirst() {
    head = head?.nextNode;
    if (head == null) {
      tail = null;
    }
    if (size != null) size = size! - 1;
  }

  getOneNode({required int index}) {
    Node? node = head;
    for (var i = 0; i < index; i++) {
      node = node?.nextNode;
    }
    return node;
  }

  deleteLast() {
    if (size! <= 1) {
      deletFirst();
    }

    Node secondLastNode = getOneNode(index: size! - 2);
    tail = secondLastNode;
    tail?.nextNode = null;
    size = size! - 1;
  }

  deleteNode({required int index}) {
    if (index == 0) {
      deletFirst();
    }
    if (index == size! - 1) {
      deleteLast();
    }
    Node previousNode = getOneNode(index: index - 1);
    previousNode.nextNode = previousNode.nextNode?.nextNode;
    if (size != null) size = size! - 1;
  }
}

void main() {
  LinkedList l = LinkedList();
  l.addNode(data: 10);
  l.addNode(data: 20);
  l.addNode(data: 30);
  l.addNode(data: 40);
  l.display();
}
