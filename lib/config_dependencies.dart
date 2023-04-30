import 'package:get/get.dart';
import 'package:suggest/services/disease_service.dart';
import 'package:suggest/services/veg_service.dart';


class ConfigDependencies extends GetxService {
  static ConfigDependencies get to => Get.find();

  Future<ConfigDependencies> init() async {
    await Get.putAsync(() => DiseaseService().init());
    await Get.putAsync(() => VegService().init());
    return this;
  }
}
