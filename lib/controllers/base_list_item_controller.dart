import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


abstract class BaseListItemController extends GetxController{
  RxList items = [].obs;
  RxList filteredItems = [].obs;
  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredItems(items);
      return;
    }

    filteredItems.value = items
        .where((element) => _hasMatched(element, value))
        .toList();
  }

  bool _hasMatched(dynamic item, String searchString) {
    if (item.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < item.description.length; ++i) {
      if (item.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}