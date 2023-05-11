import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/controllers/junk_list_controller.dart';


class JunkListBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put<BaseListItemController>(JunkListController());
    // Get.lazyPut(() => JunkListController());
  }
}
