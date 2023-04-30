import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/services/disease_service.dart';


class DiseaseListController extends GetxController {
  RxList<Disease> diseases = <Disease>[].obs;
  RxList<Disease> filteredDiseases = <Disease>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      diseases.value = DiseaseService.to.diseases;
      filteredDiseases.value = diseases;
    } catch (e) {
      debugPrint("DiseaseController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    if (value == null || value.isEmpty) {
      filteredDiseases(diseases);
      return;
    }

    filteredDiseases.value = diseases
        .where((Disease element) => _hasMatched(element, value))
        .toList();
  }

  bool _hasMatched(Disease disease, String searchString) {
    if (disease.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < disease.description.length; ++i) {
      if (disease.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}
