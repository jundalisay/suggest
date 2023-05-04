import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/models/carbon.dart';
import 'package:suggest/services/carbon_service.dart';



class CarbonListController extends GetxController {
  RxList<Carbon> carbons = <Carbon>[].obs;
  RxList<Carbon> filteredCarbons = <Carbon>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      carbons.value = CarbonService.to.carbons;
      filteredCarbons.value = carbons;
    } catch (e) {
      debugPrint("CarbonController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredCarbons(carbons);
      return;
    }

    filteredCarbons.value = carbons
      .where((Carbon element) => _hasMatched(element, value))
      .toList();
  }

  bool _hasMatched(Carbon carbon, String searchString) {
    if (carbon.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < carbon.description.length; ++i) {
      if (carbon.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}
