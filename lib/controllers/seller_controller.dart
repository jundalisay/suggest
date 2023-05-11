import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/models/seller.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/services/veg_service.dart';


class SellerController extends GetxController {
  Seller? seller;

  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  Future<void> _initialize() async {
    try {
      final arguments = Get.arguments;
      if (arguments != null) {
        seller = Get.arguments as Seller;
      }
    } catch (e) {
      debugPrint("SellerController._initialize: $e");
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
