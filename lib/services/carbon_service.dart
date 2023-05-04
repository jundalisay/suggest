import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:suggest/models/carbon.dart';



class CarbonService extends GetxService {
  static CarbonService get to => Get.find();

  List<Carbon> carbons = [];

  Future<CarbonService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/carbons.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      carbons = jsonResponse.map((data) => Carbon.fromJson(data)).toList();
    } catch (e) {
      debugPrint("CarbonService.init: $e");
    }

    return this;
  }
}
