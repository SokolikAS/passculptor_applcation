import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SavedJSon {
  const SavedJSon(this.name);

  final String name;

  Future<String> get path async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$name.json';
  }

  Future<Map<String, Set<String>>> get jsonMap async {
    final file = File(await path);

    // file.deleteSync();

    if (!file.existsSync()) file.writeAsStringSync(jsonEncode({}));

    final String jsonString = file.readAsStringSync();
    return _correctMap(jsonDecode(jsonString));
  }

  Future<void> write(String key, String word) async {
    final file = File(await path);

    final Map<String, Set<String>> jsonMap = await this.jsonMap;
    _addToMap(key, word, jsonMap);
    // print(jsonMap);

    Map<String, List<dynamic>> serializebleMap = jsonMap.map(
      (key, value) => MapEntry(key, value.toList()),
    );
    file.writeAsStringSync(jsonEncode(serializebleMap));
  }

  Map<String, Set<String>> _correctMap(Map<String, dynamic> jsonMap) {
    final Map<String, Set<String>> resultMap = {};
    jsonMap.forEach((key, value) {
      if (value is List) {
        resultMap[key] = value.map((item) => item.toString()).toSet();
      } else {
        throw FormatException(
            'Invalid JSON format: expected List for key $key');
      }
    });
    return resultMap;
  }

  static void _addToMap(String key, String word, Map<String, dynamic> map) {
    key = _maskString(key);

    if (!map.keys.contains(key)) {
      map[key] = <String>{};
    }
    map[key]!.add(word);
  }

  static String _maskString(String input) {
    if (input.isEmpty) return input;
    return input[0] + '*' * (input.length - 1);
  }
}
