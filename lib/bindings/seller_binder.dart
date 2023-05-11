import 'package:get/get.dart';
import 'package:suggest/controllers/seller_controller.dart';
import 'package:suggest/controllers/seller_list_controller.dart';


class SellerBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => SellerController());
  }
}
