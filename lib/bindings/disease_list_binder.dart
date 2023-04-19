import 'package:get/get.dart';
import 'package:suggestion_app/controllers/disease_list_controller.dart';


class DiseaseListBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(()=>DiseaseListController());
  }
}
