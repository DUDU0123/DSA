class QueueNode{
  int? data;
  QueueNode? nextNode;
  QueueNode({required this.data});
  QueueNode.both({required this.data, required this.nextNode});
}

class Queue{
  QueueNode? front;
  QueueNode? rear;


  enqueue({required int data}){
    QueueNode node = QueueNode(data: data);
    if (rear ==null) {
      front=rear=node;
      return;
    }
    rear?.nextNode = node;
    rear = node;
  }
  dequeue(){
    if (front==null) {
      return;
    }
    front = front?.nextNode;
    if (front==null) {
      rear =null;
    }
  }
  isEmpty(){
    return front==null;
  }
  peek(){
    return front?.data;
  }
  display(){
    QueueNode? node = front;
    if (front==null) {
      return;
    }
    while (node!=null) {
      print(node.data);
      node = node.nextNode;
    }
  }
}