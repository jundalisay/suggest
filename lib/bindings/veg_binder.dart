import 'package:get/get.dart';
import 'package:suggestion_app/controllers/veg_controller.dart';


class VegBinding extends Bindings {
  
  @override
  void dependencies() {

    Get.lazyPut(() => VegController());
  }
}
