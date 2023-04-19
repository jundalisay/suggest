import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/nutri.dart';
import 'package:suggestion_app/services/nutri_service.dart';


class NutriListController extends GetxController {
  RxList<Nutri> nutris = <Nutri>[].obs;
  RxList<Nutri> filteredNutris = <Nutri>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      nutris.value = NutriService.to.nutris;
      filteredNutris.value = nutris;
    } catch (e) {
      debugPrint("NutriController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredNutris(nutris);
      return;
    }

    filteredNutris.value = nutris
        .where((Nutri element) => _hasMatched(element, value))
        .toList();
  }

  bool _hasMatched(Nutri nutri, String searchString) {
    if (nutri.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < nutri.description.length; ++i) {
      if (nutri.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}
