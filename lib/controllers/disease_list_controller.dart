import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/services/disease_service.dart';


class DiseaseListController extends BaseListItemController {

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      items.value = DiseaseService.to.diseases;
      filteredItems.value = items;
    } catch (e) {
      debugPrint("DiseaseController._initialize: $e");
    }
  }
}
