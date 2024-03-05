import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WishedNotifier extends ChangeNotifier {
  final wishedBox = Hive.box<int>('wished_box');
  List<int> wishedIds = [];

  Future<void> getAllWishedListIds() async {
    wishedIds.clear();
    wishedIds = wishedBox.values.toList();
    notifyListeners();
  }

  Future<void> createWishList(int id) async {
    if (!wishedIds.contains(id)) {
      await wishedBox.add(id);
      wishedIds.add(id);
    } else {
      int deleteKey = 0;
      Map<dynamic, int> wishedMap = wishedBox.toMap();
      wishedMap.forEach((key, value) {
        if (value == id) {
          deleteKey = key;
        }
      });

      await wishedBox.delete(deleteKey);
      wishedIds.removeWhere((element) => element == id);
    }

    notifyListeners();
  }
}
