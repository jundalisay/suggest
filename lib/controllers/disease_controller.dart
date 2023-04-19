import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:suggestion_app/models/disease.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/services/veg_service.dart';


class DiseaseController extends GetxController {
  Disease? disease;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        disease = Get.arguments as Disease;
      }
    } catch (e) {
      debugPrint("DiseaseController._initialize: $e");
    }
  }

  Veg? getVeg({required String vegName}) {
    final vegs = VegService.to.vegs;
    final index = vegs.indexWhere(
        (element) => element.name.toLowerCase() == vegName.toLowerCase());
    if (index >= 0) {
      return vegs.elementAt(index);
    }
    return null;
  }
}
