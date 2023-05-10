import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/models/nutri.dart';
import 'package:suggest/services/nutri_service.dart';



class NutriListController extends BaseListItemController {

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      items.value = NutriService.to.nutris;
      filteredItems.value = items;
    } catch (e) {
      debugPrint("NutriController._initialize: $e");
    }
  }
}
