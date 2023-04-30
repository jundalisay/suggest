import 'package:get/get.dart';
import 'package:suggest/controllers/nutri_controller.dart';
import 'package:suggest/controllers/nutri_list_controller.dart';


class NutriBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => NutriController());
  }
}
