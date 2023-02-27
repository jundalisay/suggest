import 'package:get/get.dart';
import 'package:suggestion_app/controllers/veg_list_controller.dart';


class VegListBinding extends Bindings {
  
  @override
  void dependencies() {

    Get.lazyPut(() => VegListController());
  }
}
