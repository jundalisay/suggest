import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:suggest/models/seller.dart';



class SellerService extends GetxService {
  static SellerService get to => Get.find();

  List<Seller> sellers = [];

  Future<SellerService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/sellers.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    try {
      sellers = jsonResponse.map((data) => Seller.fromJson(data)).toList();
    } catch (e) {
      debugPrint("SellerService.init: $e");
    }

    return this;
  }
}
