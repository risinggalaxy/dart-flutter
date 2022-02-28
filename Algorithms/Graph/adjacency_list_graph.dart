void main() {
  performGraphSearch();
}

//FIFO - First In First Out
class Queue<T> {
  //Private queue list i.e Array
  final List<T> _queue = [];
  //Returns length i.e number of queue elements
  int length() { return _queue.length; }
  //Returns a bool value true || false
  bool isEmpty() {return _queue.isEmpty;}
  //Returns the first element added to the queue
  T? peek() {return _queue.first;}
  //Adds new element of <T> to the queue
  void insert(T element) {_queue.add(element);}
  //Removes and returns the top element inside the queue
  T? remove() {
    if (isEmpty()) {return null;} else {return _queue.removeAt(0);}}
}

//LIFO - Last In Last Out
class Stack<T> {
  //Private stack list i.e Array
  final List<T> _stack = [];
  //Returns length i.e number of stack elements
  int length() {return _stack.length;}
  //Returns a bool value true || false
  bool isEmpty() {return _stack.isEmpty;}
  //Returns the last element added to the stack
  T? top() {return _stack.last;}
  //Adds new element of <T> to the stack
  void push(T element) { _stack.add(element); }
  //Removes and returns the top element inside the stack
  T? pop() { if (isEmpty()) { return null; } else {return _stack.removeLast();}}
}

//Graph Class
class Graph {
  int _numberOfVertices = 0;
  final List<List<int>> _adjacencyList = [];  
  Graph(int numberOfVertices) {
    _numberOfVertices = numberOfVertices;
    for( var i = 0; i <= _numberOfVertices; i++ ) {_adjacencyList.add([]);}}
  
  //Adding edges to the vertex
  void addEdge(int v, int w) {_adjacencyList[v].add(w);}
  
  //Breadth First Search
  List<int> breadthFirstSearch(int s) {
    List<int> results = [];
    List<bool> visited = _adjacencyList.map((_) => (false)).toList();
    Queue<int> queue = Queue();
    visited[s] = true;
    queue.insert(s);
    results.add(s);
    while (queue.length() > 0) {
      int current = queue.remove()!;
      for (int n in _adjacencyList[current]) {
        if (!visited[n]) {
            visited[n] = true;
            queue.insert(n);
            results.add(n);}}}
    return results;}
  
  //Depth First Search
  List<int> depthFirstSearch(int s) {
    List<int> results = [];
    List<bool> visited = _adjacencyList.map((_) => (false)).toList();
    Stack<int> stack = Stack();
    stack.push(s);
    visited[s] = true;
    while (stack.length() > 0) {
      int current = stack.pop()!;
      results.add(current);
      for (int n in _adjacencyList[current]) {
        if (!visited[n]) {
          visited[n] = true;
          stack.push(n);}}}
    return results;}
}

void performGraphSearch() {
   Graph graph = Graph(8);
  graph.addEdge(0,1);
  graph.addEdge(1,4);
  graph.addEdge(4,6);
  graph.addEdge(6,0);
  graph.addEdge(1,5);
  graph.addEdge(5,3);
  graph.addEdge(3,0);
  graph.addEdge(5,2);
  graph.addEdge(2,7);
  List<int> bsf = graph.breadthFirstSearch(0);
  List<int> dsf = graph.depthFirstSearch(0);
  print('Breadth First Search: $bsf');
  print('Depth First Search: $dsf');
}
