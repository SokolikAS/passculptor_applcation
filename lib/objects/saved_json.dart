import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SavedJSon {
  SavedJSon({required this.file});

  final File file;
  Map<String, Set<String>>? _jsonMap;

  Map<String, Set<String>> get jsonMap {
    if (_jsonMap == null) {
      // Создание мапы.
      final String jsonString = file.readAsStringSync();
      _jsonMap = _correctMap(jsonDecode(jsonString));
    }
    return _jsonMap!;
  }

  set jsonMap(Map<String, Set<String>> newMap) => _jsonMap = newMap;

  // Фабричный конструктор.
  static Future<SavedJSon> create(String fileName) async {
    // Создание файла.
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.json');

    if (!file.existsSync()) file.writeAsStringSync(jsonEncode({}));

    return SavedJSon(file: file);
  }

  Future<void> addPairToJson(String key, String word) async {
    _addToMap(key, word, jsonMap);

    Map<String, List<dynamic>> serializebleMap = jsonMap.map(
      (key, value) => MapEntry(key, value.toList()),
    );

    await file.writeAsString(jsonEncode(serializebleMap));
  }

  static Map<String, Set<String>> _correctMap(Map<String, dynamic> jsonMap) {
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

    if (!map.keys.contains(key)) map[key] = <String>{};

    map[key]!.add(word);
  }

  static String _maskString(String input) {
    if (input.isEmpty) return input;
    return input[0] + '*' * (input.length - 1);
  }
}
