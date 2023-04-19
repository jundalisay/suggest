import 'package:get/get.dart';
import 'package:suggestion_app/controllers/nutri_controller.dart';
import 'package:suggestion_app/controllers/nutri_list_controller.dart';


class NutriBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => NutriController());
  }
}
