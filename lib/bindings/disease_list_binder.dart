import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';
import 'package:suggest/controllers/disease_list_controller.dart';


class DiseaseListBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<BaseListItemController>(DiseaseListController());
  }
}
