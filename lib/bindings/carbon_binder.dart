import 'package:get/get.dart';
import 'package:suggest/controllers/carbon_controller.dart';
import 'package:suggest/controllers/carbon_list_controller.dart';


class CarbonBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => CarbonController());
  }
}
