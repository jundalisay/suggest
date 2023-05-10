import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/controllers/nutri_list_controller.dart';


class NutriListBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<BaseListItemController>(NutriListController());
  }
}
