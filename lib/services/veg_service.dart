import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/models/disease.dart';
import 'package:suggestion_app/models/veg.dart';

class VegService extends GetxService {
  static VegService get to => Get.find();

  List<Veg> vegs = [];

  Future<VegService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/vegs.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      vegs = jsonResponse.map((data) => Veg.fromJson(data)).toList();
    } catch (e) {
      debugPrint("VegService.init: $e");
    }

    return this;
  }
}
