import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/controllers/carbon_list_controller.dart';


class CarbonListBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put<BaseListItemController>(CarbonListController());
  }
}
