import 'package:get/get.dart';
import 'package:suggest/services/disease_service.dart';
import 'package:suggest/services/veg_service.dart';
import 'package:suggest/services/nutri_service.dart';
import 'package:suggest/services/carbon_service.dart';


class ConfigDependencies extends GetxService {
  static ConfigDependencies get to => Get.find();

  Future<ConfigDependencies> init() async {
    await Get.putAsync(() => DiseaseService().init());
    await Get.putAsync(() => VegService().init());
    await Get.putAsync(() => NutriService().init());  
    await Get.putAsync(() => CarbonService().init());
    return this;
  }
}
