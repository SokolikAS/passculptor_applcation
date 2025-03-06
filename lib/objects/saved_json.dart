class SavedJSon {
  final Map<String, Set<String>> _map = <String, Set<String>>{};

  Map<String, Set<String>> get map => _map;

  void add(String key, String word) {
    key = _maskString(key);

    if (!_map.keys.contains(key)) {
      _map[key] = <String>{};
    }
    _map[key]!.add(word);
  }

  static String _maskString(String input) {
    if (input.isEmpty) return input;
    return input[0] + '*' * (input.length - 1);
  }

  @override
  String toString() => map.toString();
}
