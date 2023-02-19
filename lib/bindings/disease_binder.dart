import 'package:get/get.dart';
import 'package:suggestion_app/controllers/disease_conrtoller.dart';

class DiseaseBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(()=>DiseaseController());
  }
}
