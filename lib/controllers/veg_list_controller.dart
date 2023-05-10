import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/services/veg_service.dart';



class VegListController extends BaseListItemController {

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      items.value = VegService.to.vegs;
      filteredItems.value = items;
    } catch (e) {
      debugPrint("VegController._initialize: $e");
    }
  }
}

