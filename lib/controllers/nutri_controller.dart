import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:suggest/models/disease.dart';
import 'package:suggest/services/disease_service.dart';
import 'package:suggest/models/nutri.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/services/veg_service.dart';


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

  Disease? getDisease({required String diseaseName}) {
    final diseases = DiseaseService.to.diseases;
    final index = diseases.indexWhere(
      (element) => element.name.toLowerCase() == diseaseName.toLowerCase());
    if (index >= 0) {
      return diseases.elementAt(index);
    }
    return null;
  }    
}
