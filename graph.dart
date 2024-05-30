class GraphStructure {
  Map<int, List<int>> map = {};

  add({required int vertex}) {
    map[vertex] = [];
  }

  insert(
      {required int vertex,
      required int edgeVertex,
      required bool isBidirectional}) {
    if (!map.containsKey(vertex)) {
      add(vertex: vertex);
    }

    if (!map.containsKey(edgeVertex)) {
      add(vertex: edgeVertex);
    }
    map[vertex]?.add(edgeVertex);
    if (isBidirectional) {
      map[edgeVertex]?.add(vertex);
    }
  }

  displayGraph() {
    map.forEach((vertex, edgeVertex) {
      print("$vertex : $edgeVertex");
    });
  }

  // Traversal
  BFS({required int startVertex}) {
    List<int> queue = [];
    int maxVertexIndex = 0;
    map.forEach((vertex, adjacentVertices) {
      if (vertex > maxVertexIndex) {
        maxVertexIndex = vertex;
      }
      for (var adjacentVertex in adjacentVertices) {
        if (adjacentVertex > maxVertexIndex) {
          maxVertexIndex = vertex;
        }
      }
    });
    List<bool> visited = List.filled(maxVertexIndex+1, false);
    visited[startVertex] = true;
    queue.add(startVertex);
    while (queue.isNotEmpty) {
      int currentVertex = queue.removeAt(0);
      for (var adjVertex in map[currentVertex]!) {
        if (!visited[adjVertex]) {
          visited[adjVertex] = true;
          queue.add(adjVertex);
        }
      }
    }
  }

  DFS({required int startVertex}) {
    int maxVertexIndex = 0;
    map.forEach((vertex, adjacentVertices) {
      if (vertex > maxVertexIndex) {
        maxVertexIndex = vertex;
      }
      for (var adjacentVertex in adjacentVertices) {
        if (adjacentVertex > maxVertexIndex) {
          maxVertexIndex = vertex;
        }
      }
    });
    List<bool> visited = List.filled(maxVertexIndex+1, false);
    List<int> stack = [];
    stack.add(startVertex);
    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      if (!visited[currentVertex]) {
        visited[currentVertex] = true;
        for (var adjVertex in map[currentVertex]!) {
          if (!visited[adjVertex]) {
            visited[adjVertex] = true;
            stack.add(adjVertex);
          }
        }
      }
    }
  }

  cycleChecker({required int startVertex}) {
    int maxVertexIndex = 0;
    map.forEach((vertex, adjacentVertices) {
      if (vertex > maxVertexIndex) {
        maxVertexIndex = vertex;
      }
      for (var adjVertex in adjacentVertices) {
        if (adjVertex > maxVertexIndex) {
          maxVertexIndex = adjVertex;
        }
      }
    });

    List<bool> visited = List.filled(maxVertexIndex + 1, false);

    List<int> stack = [];
    int count = 0;
   
    stack.add(startVertex);

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      if (!visited[currentVertex]) {
        visited[currentVertex] = true;
        for (var adjacentVertex in map[currentVertex]!) {
          if (!visited[adjacentVertex]) {
            visited[adjacentVertex] = true;
            stack.add(adjacentVertex);
          }
          if (currentVertex==adjacentVertex) {
            count++;
          }
        }
      }
    }
  print(count);
  }
}

void main(){
  GraphStructure graph = GraphStructure();
  graph.insert(vertex: 10, edgeVertex: 2, isBidirectional: true);
  graph.insert(vertex: 4, edgeVertex: 10, isBidirectional: true);
  graph.insert(vertex: 5, edgeVertex: 3, isBidirectional: true);
  graph.insert(vertex: 7, edgeVertex: 4, isBidirectional: true);
  graph.insert(vertex: 44, edgeVertex: 4, isBidirectional: true);
  graph.displayGraph();
  graph.cycleChecker(startVertex: 10);
}
