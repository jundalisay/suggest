import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/models/junk.dart';
import 'package:suggest/services/junk_service.dart';



class JunkListController extends GetxController {
  RxList<Junk> junks = <Junk>[].obs;
  RxList<Junk> filteredJunks = <Junk>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      junks.value = JunkService.to.junks;
      filteredJunks.value = junks;
    } catch (e) {
      debugPrint("JunkController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredJunks(junks);
      return;
    }

    filteredJunks.value = junks
      .where((Junk element) => _hasMatched(element, value))
      .toList();
  }

  bool _hasMatched(Junk junk, String searchString) {
    if (junk.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < junk.description.length; ++i) {
      if (junk.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}
