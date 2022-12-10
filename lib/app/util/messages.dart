import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../config/constant.dart';

class Messages extends Translations {
  final Map<String, Map<String, String>> languages;
  Messages({required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages;
  }

  //fetch json files from assets and decode it and return the map
  static Future<Map<String, Map<String, String>>> getAllTranslations() async {
    Map<String, Map<String, String>> languages = {};
    for (int i = 0; i < Constants.locale.length; i++) {
      String jsonStringValues = await rootBundle.loadString(
          'assets/language/${Constants.locale[i]['name'].toLowerCase()}.json');
      Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
      Map<String, String> jsonData = {};
      mappedJson.forEach((key, value) {
        jsonData[key] = value.toString();
      });
      languages[Constants.locale[i]['name']] = jsonData;
    }
    return languages;
  }
}
