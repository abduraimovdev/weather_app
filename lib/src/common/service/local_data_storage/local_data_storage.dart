import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/main/screens/add_card/data/models/card_model.dart';

class LocalDataStorage {
  const LocalDataStorage._();

  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("app");
  }

  static Future<void> setCard(List<CardModel> cards) async {
    await _box.put("cards", jsonEncode(cards.map((e) => e.toJson()).toList()));
  }

  static Future<List<CardModel>> getCars() async {
    final response = _box.get("cards", defaultValue: jsonEncode([]));
    final data = jsonDecode(response);
    return (data as List).map((e) => CardModel.fromJson(e)).toList();
  }

  static Future<List<dynamic>> getCarsJson() async {
    final response = _box.get("cards");
    return jsonDecode(response);
  }
}
