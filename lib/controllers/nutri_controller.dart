import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:suggestion_app/models/nutri.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/services/veg_service.dart';


class NutriController extends GetxController {
  Nutri? nutri;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        nutri = Get.arguments as Nutri;
      }
    } catch (e) {
      debugPrint("NutriController._initialize: $e");
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
