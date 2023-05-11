import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/models/seller.dart';
import 'package:suggest/services/seller_service.dart';



class SellerListController extends BaseListItemController {

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      items.value = SellerService.to.sellers;
      filteredItems.value = items;
    } catch (e) {
      debugPrint("SellerController._initialize: $e");
    }
  }
}
