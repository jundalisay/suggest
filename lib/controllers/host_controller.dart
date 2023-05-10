import 'package:get/get.dart';


class HostController extends GetxController {
  // String url = "http://192.168.254.125:4001/";
  String url = "https://laspinas.pantrypoints.com/api/";  
  String city = "Las Pinas";

  void laspinas(){
    url = "https://laspinas.pantrypoints.com/api/";
    city = "Las Pinas";
    update();    
  }  

  void makati(){
    url = "https://makati.pantrypoints.com/api/";
    city = "Makati";
    update();    
  }

}  
