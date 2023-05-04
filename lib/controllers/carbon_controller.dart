import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/models/carbon.dart';


class CarbonController extends GetxController {
  Carbon? carbon;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        carbon = Get.arguments as Carbon;
      }
    } catch (e) {
      debugPrint("CarbonController._initialize: $e");
    }
  }

}
