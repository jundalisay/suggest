import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/veg.dart';



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
}

