import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getJsonData(String path) async {
  final String data = await rootBundle.loadString(path);
  return jsonDecode(data);
}
