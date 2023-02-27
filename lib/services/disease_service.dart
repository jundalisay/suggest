import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/disease.dart';

class DiseaseService extends GetxService {
  static DiseaseService get to => Get.find();

  List<Disease> diseases = [];

  Future<DiseaseService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/diseases.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      diseases = jsonResponse.map((data) => Disease.fromJson(data)).toList();
    } catch (e) {
      debugPrint("DiseaseService.init: $e");
    }

    return this;
  }
}
