class TrieNode {
  Map<String, TrieNode> trieMap = {};
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = '*';
  add({required String value}){
    buildTrie(str: value);
  }
  buildTrie({required String str}){
    for (var i = 0; i < str.length; i++) {
      insertAtPosition(value: str, startIndex: i);
    }
  }

  insertAtPosition({required String value, required int startIndex}){
    TrieNode node = root;
    for (var i = startIndex; i < value.length; i++) {
      if (!node.trieMap.containsKey(value[i])) {
       TrieNode newNode= TrieNode();
        node.trieMap[value[i]] = newNode;
      
      }
     node =  node.trieMap[value[i]]!;
    }
    node.trieMap[endSymbol] = TrieNode();
  }

  contains({required String value}){
    TrieNode node = root;
    for (var i = 0; i < value.length; i++) {
      if (!node.trieMap.containsKey(value[i])) {
      return false;
    }
    node = node.trieMap[value[i]]!;
    }
    return node.trieMap.containsKey(endSymbol);
  }
}
