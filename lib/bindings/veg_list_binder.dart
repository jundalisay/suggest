import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/controllers/veg_list_controller.dart';


class VegListBinding extends Bindings {
  
  @override
  void dependencies() {

    Get.put<BaseListItemController>( VegListController());
  }
}
