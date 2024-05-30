class BinaryTreeNode {
  int? data;
  BinaryTreeNode({
    this.data,
  });
  BinaryTreeNode? leftNode;
  BinaryTreeNode? rightNode;
}


class BinarySearchTree{
  BinaryTreeNode? root;

  insert({required int data}){
    BinaryTreeNode? node = root;
    if (node==null) {
      root = BinaryTreeNode(data: data);
    }

    while (node!=null) {
      if (data<node.data!) {
        if (node.leftNode==null) {
          node.leftNode = BinaryTreeNode(data: data);
          break;
        }else{
          node = node.leftNode;
        }
      }else if(data>node.data!){
        if (node.rightNode==null) {
          node.rightNode = BinaryTreeNode(data: data);
          break;
        }else{
          node = node.rightNode;
        }
      }
    }
  }


  contains({required int data}){
    BinaryTreeNode? node = root;
    while (node!=null) {
      if (data<node.data!) {
        node = node.leftNode;
      }else if(data>node.data!){
        node = node.rightNode;
      }else{
        return true;
      }
    }
    return false;
  }

  inOrder(){
    print("InOrder");
    inOrderHelper(node: root);
  }
  preOrder(){
    print("PreOrder");
    preOrderHelper(node: root);
  }
  postOrder(){
    print("PostOrder");
    postOrderHelper(node: root);
  }

  inOrderHelper({required BinaryTreeNode? node}){
    inOrderHelper(node: node?.leftNode);
    print(node?.data);
    inOrderHelper(node: node?.rightNode);
  }
  preOrderHelper({required BinaryTreeNode? node}){
    print(node?.data);
    preOrderHelper(node: node?.leftNode);
    preOrderHelper(node: node?.rightNode);
  }
  postOrderHelper({required BinaryTreeNode? node}){
    postOrderHelper(node: node?.leftNode);
    postOrderHelper(node: node?.rightNode);
    print(node?.data);
  }
}