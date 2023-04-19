import 'package:get/get.dart';
import 'package:suggestion_app/controllers/disease_controller.dart';
import 'package:suggestion_app/controllers/disease_list_controller.dart';


class DiseaseBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(()=>DiseaseController());
  }
}
