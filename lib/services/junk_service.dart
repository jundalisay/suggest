import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:suggest/models/junk.dart';



class JunkService extends GetxService {
  static JunkService get to => Get.find();

  List<Junk> junks = [];

  Future<JunkService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/junks.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      junks = jsonResponse.map((data) => Junk.fromJson(data)).toList();
    } catch (e) {
      debugPrint("JunkService.init: $e");
    }

    return this;
  }
}
