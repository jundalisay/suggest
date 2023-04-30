import 'package:get/get.dart';
import 'package:suggest/controllers/disease_controller.dart';
import 'package:suggest/controllers/disease_list_controller.dart';


class DiseaseBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(()=>DiseaseController());
  }
}
