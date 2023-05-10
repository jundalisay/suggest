import 'package:get/get.dart';
import 'package:suggest/controllers/junk_controller.dart';
import 'package:suggest/controllers/junk_list_controller.dart';


class JunkBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => JunkController());
  }
}
