void main() {
  
  BinarySearchTree bst = BinarySearchTree();
  
  bst.insert(5);
  bst.insert(3);
  bst.insert(8);
  bst.insert(6);
  bst.insert(7);
  bst.insert(4);
  bst.insert(2);
  bst.insert(1);
  
  bst.traverse(Traversal.inOrder);
  List<int> inOrder = bst.order;
  print('InOrder Tree Order $inOrder');
  
  bst.traverse(Traversal.preOrder);
  List<int> preOrder = bst.order;
  print('PreOrder Tree Order $preOrder');
  
  bst.traverse(Traversal.postOrder);
  List<int> postOrder = bst.order;
  print('PostOrder Tree Order $postOrder');
  
}

class BinaryNode {
  int key;
  BinaryNode? right;
  BinaryNode? left;
  BinaryNode? min() {
    if (left == null) {
      return this;
    } else {
      return left!.min();
    }
  }
  BinaryNode(this.key);
}

enum Traversal {
  inOrder, preOrder, postOrder
}

class BinarySearchTree {
  
  BinaryNode? _root;
  List<int> order = [];
  
  //Public Methods
  void insert(int key) {
    _root = _insert(_root, key);
  }
  
  int? find(int key){
    if (_root != null) {
      BinaryNode? n = _find(_root, key);
      if (n != null) {
        return n.key;
      }
    }
    return null;
  }
  
   int findMin() {
    if (_root != null) {
      BinaryNode n = _findMin(_root)!;
      return n.key;
    }
    return 0;
  }
  
  void delete(int key) {
    if (_root != null) {
      _delete(_root, key);
    }
  }
  
  
  //Private Methods
    BinaryNode _insert(BinaryNode? node, int key){
    if (node == null) {
      BinaryNode newNode = BinaryNode(key);
      return newNode;
    }
      BinaryNode n = node;
      if (key < n.key) {
        n.left = _insert(n.left, key);
      } else if (key > n.key) {
        n.right = _insert(n.right, key);
      }
      return n;
  }
  
  BinaryNode? _find(BinaryNode? node, int key) {
    if (node == null) {
      return null;
    } else {
      BinaryNode n = node;
      if (key == n.key) {
        return n;
      } else if (key < n.key) {
        return _find(n.left, key);
      } else if (key > n.key) {
        return _find(n.right, key);
      }
    }
    return null;
  }
  
  BinaryNode? _findMin(BinaryNode? node) {
    if (node != null) {
      return node.min()!;
    }
    return null;
  }
  
  BinaryNode? _delete(BinaryNode? node, int key){
    if (node == null) {
      return null;
    }
    
    BinaryNode n = node;
    
    //Finding the correct node
    if (key < n.key) {
      n.left = _delete(n.left, key);
    } else if (key > n.key ){
      n.right = _delete(n.right, key);
    } else {
      //Found the node
      //Node has no children
      if (n.left == null && n.right == null) {
        return null;
        
        //Node has one child
      } else if (n.left == null) {
        return n.right;
      }  else if (n.right == null) {
        return n.left;
        
        //Node has two children
      } else {
        BinaryNode minRight = _findMin(n.right)!;
        n.key = minRight.key;
        n.right = _delete(n.right, n.key);  
      } 
    }
    return n;
  }
  
  void traverse( Traversal mode) {
    if (order.isNotEmpty) {
      order.clear();
    }
    switch (mode) {
        case Traversal.inOrder: _inOrder(_root);
        break;
        case Traversal.preOrder: _preOrder(_root);
        break;
        case Traversal.postOrder: _postOrder(_root);
        break;
      default: break;
    }
  }
  
  void _inOrder(BinaryNode? node) {
    //left, root, right
    if(node != null) {
      _inOrder(node.left);
      order.add(node.key);
      _inOrder(node.right);
    }
  }
  
  void _preOrder(BinaryNode? node) {
    //root, left, right
    if (node != null) {
      order.add(node.key);
      _preOrder(node.left);
      _preOrder(node.right);
    }
  }
  
  void _postOrder(BinaryNode? node) {
    //left, right, root
    if (node != null) {
      _postOrder(node.left);
      _postOrder(node.right);
      order.add(node.key);
    }
  } 
}
