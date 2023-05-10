import 'package:get/get.dart';
import 'package:suggest/controllers/junk_list_controller.dart';


class JunkListBinding extends Bindings {
  
  @override
  void dependencies() {

    Get.lazyPut(() => JunkListController());
  }
}
