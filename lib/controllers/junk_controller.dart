import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:suggest/models/junk.dart';

import 'package:suggest/models/disease.dart';
import 'package:suggest/services/disease_service.dart';


class JunkController extends GetxController {
  Junk? junk;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        junk = Get.arguments as Junk;
      }
    } catch (e) {
      debugPrint("JunkController._initialize: $e");
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
