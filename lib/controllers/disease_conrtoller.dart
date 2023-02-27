import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:suggestion_app/models/disease.dart';


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
}
