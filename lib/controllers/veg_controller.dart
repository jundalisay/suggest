import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/disease.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/services/disease_service.dart';

class VegController extends GetxController {
  Veg? veg;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        veg = Get.arguments as Veg;
      }
    } catch (e) {
      debugPrint("VegController._initialize: $e");
    }
  }

  Disease? getDisease({required diseaseName}) {
    final diseases = DiseaseService.to.diseases;
    final index = diseases.indexWhere(
        (element) => element.name.toLowerCase() == diseaseName.toLowerCase());
    if (index >= 0) {
      return diseases.elementAt(index);
    }
    return null;
  }
}
