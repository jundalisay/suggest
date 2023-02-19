import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/veg.dart';



class VegController extends GetxController {
  RxList<Veg> vegs = <Veg>[].obs;
  RxList<Veg> filteredVegs = <Veg>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/vegs.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      vegs.value =
          jsonResponse.map((data) => Veg.fromJson(data)).toList();
      filteredVegs.value = vegs;
    } catch (e) {
      debugPrint("VegController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredVegs(vegs);
      return;
    }

    filteredVegs.value = vegs
        .where((Veg element) => _hasMatched(element, value))
        .toList();
  }

  bool _hasMatched(Veg veg, String searchString) {
    if (veg.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < veg.description.length; ++i) {
      if (veg.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}

