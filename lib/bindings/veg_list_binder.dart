import 'package:get/get.dart';
import 'package:suggest/controllers/veg_list_controller.dart';


class VegListBinding extends Bindings {
  
  @override
  void dependencies() {

    Get.lazyPut(() => VegListController());
  }
}
