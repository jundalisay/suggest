import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/models/carbon.dart';
import 'package:suggest/services/carbon_service.dart';



class CarbonListController extends BaseListItemController {

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      items.value = CarbonService.to.carbons;
      filteredItems.value = items;
    } catch (e) {
      debugPrint("CarbonController._initialize: $e");
    }
  }
}
