# suggestion


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';

import 'package:flutter/services.dart';


class VegScreen extends GetView<VegController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );


    return Scaffold( 
      backgroundColor: Colors.cyan[100],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.veg?.name ?? "",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),          
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    controller.veg!.photo,
                    fit: BoxFit.cover,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.veg!.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      controller.veg!.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    if (controller.veg != null)
                      ...controller.veg!.diseases!.map((value) {
                        // how to show a card that has a the details of the veg which will open to the Nutri Screen of that veg?  link that
                        return _diseaseWidget(context, diseaseName: value);
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _diseaseWidget(BuildContext context, {required String diseaseName}) {
    final Disease? disease = controller.getDisease(diseaseName: diseaseName);

    final currentRoute = Get.routing.current;
    // debugPrint("VegScreen._foodWidget: currentRoute: $currentRoute");

    final bool isVegRoot = currentRoute.startsWith("/diseases");
    final Color? textColor = isVegRoot ? Colors.blue : null;

    if (disease != null) {
      return InkWell(
        onTap: isVegRoot ? () {
          Get.to(() => DiseaseScreen(), arguments: disease, binding: DiseaseBinding());
        } : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              disease.photo,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              disease.name,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              disease.name,
              style: TextStyle(color: textColor),
            )
          ]
        ),
      );
    }
    return SizedBox();
  }
}



        child: ListView(
          children: [
            if (controller.veg != null) Image.asset(controller.veg!.photo),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.veg?.name ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(controller.veg?.description ?? ""),
            const SizedBox(height: 20.0),
            Text(
              "Suppliers",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.veg != null)
              ...controller.veg!.stores!.map((value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, textAlign: TextAlign.left),
                    SizedBox(height: 10.0)
                  ],
                );
              }),
            const SizedBox(height: 20.0),
            Text(
              "Good Against",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.veg != null)
              ...controller.veg!.diseases!.map((value) {
                return _diseaseWidget(context, diseaseName: value);
              }),
          ],
        ),




      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 16,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          Get.toNamed("/vegs/veg", arguments: veg);
        },
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                veg.photo,
                fit: BoxFit.cover,
                width: 100,
                height: double.infinity,
              ),
            ),
          ),
          title: Text(veg.name),
          subtitle: Text(
            veg.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );



  cupertino_icons: "1.0.5"
  flutter_localizations:
    sdk: flutter
  cached_network_image: "3.2.3"
#  dio: "4.0.0"
#  go_router: "6.0.3"
  flutter_html: "2.0.0"
#  font_awesome_flutter: "9.0.0"
  get: "4.6.5"
  get_storage: "2.1.1"
  flutter_radar_chart: "0.2.1"
#  http: "0.13.5"
  intl: "0.17.0"
  introduction_slider: "2.0.1"
  shared_preferences: "2.1.0"
#  webview_flutter: "2.8.0"
  url_launcher: "6.1.10"

dev_dependencies:
  #  flutter_native_splash: "2.2.11"
  # flutter_launcher_icons: "0.13.1"
  flutter_launcher_icons: "0.12.0"


  cupertino_icons: "1.0.3"
  flutter_localizations:
    sdk: flutter
  cached_network_image: "3.0.0"
#  dio: "4.0.0"
#  go_router: "6.0.3"
  flutter_html: "2.0.0"
  font_awesome_flutter: "9.0.0"
  get: "4.1.4"
  get_storage: "2.0.2"
  flutter_radar_chart: "0.2.1"
#  http: "0.13.5"
  intl: "0.17.0"
  introduction_slider: "2.0.1"
  shared_preferences: "2.0.6"
#  webview_flutter: "2.8.0"
  url_launcher: "6.0.6"

dev_dependencies:
  #  flutter_native_splash: "2.2.11"
  flutter_launcher_icons: "0.11.0"


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';

import 'package:flutter/services.dart';




class VegScreen extends GetView<VegController> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );


    return Scaffold( 
      backgroundColor: Colors.indigo[50],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),  
        title: Text(controller.veg?.name ?? "",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),          
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    controller.veg!.photo,
                    fit: BoxFit.cover,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.veg!.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      controller.veg!.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Suggested diseases',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    // ...controller.veg!.diseases!.map(
                    //   (value) => _disease(context, diseaseName: value)
                    // ).toList(),



                    //     GridView.builder(
                    //       itemCount: value.length,
                    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         childAspectRatio: 3/4,
                    //       ),
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return _disease(context, diseaseName: value
                    //           // name: value.name,
                    //           // image: value.photo,
                    //         );
                    //       },
                    //     );      



                    if (controller.veg != null) ...controller.veg!.diseases!.map(
                      (value) { 
                      // how to show a card that has a the details of the veg which will open to the Nutri Screen of that veg?  link that
                        return _diseaseWidget(context, diseaseName: value);
                      }
                      // {
                      //   GridView.builder(
                      //     itemCount: value.length,
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       childAspectRatio: 3/4,
                      //     ),
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return _disease(context, diseaseName: value
                      //         // name: value.name,
                      //         // image: value.photo,
                      //       );
                      //     },
                      //   );                        
                      // }
                      //   return GridView.builder(
                      //     // itemCount: 10, // Replace with your actual item count.
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       childAspectRatio: 3/4,
                      //     ),
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Card(
                      //         child: Column(
                      //           children: _diseaseWidget(context, diseaseName: value);
                      //         )
                      //       )
                      //     }
                      //   )
                      // }
                    ),                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _disease({String name, String image}) {
  // Widget _disease() {    
  // Widget _disease(BuildContext context, {required String diseaseName}) {
  Widget _diseaseWidget(BuildContext context, {required String diseaseName}) {

    // find the object via name value
    final Disease? disease = controller.getDisease(diseaseName: diseaseName);
    final currentRoute = Get.routing.current;
    debugPrint("VegScreen._diseaseWidget: currentRoute: $currentRoute");

    final bool isVegRoot = currentRoute.startsWith("/diseases");
    final Color? textColor = isVegRoot ? Colors.blue : null;

    if (disease != null) {

      return InkWell(
        onTap: () {
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   image,
            //   width: 100,
            //   height: 100,
            // ),
            SizedBox(height: 10),
            Text(
              disease.name,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    }
  }
}

  // Widget _diseaseWidget(BuildContext context, {required String diseaseName}) {
  //   final Disease? disease = controller.getDisease(diseaseName: diseaseName);

  //   final currentRoute = Get.routing.current;
  //   debugPrint("VegScreen._diseaseWidget: currentRoute: $currentRoute");

  //   final bool isVegRoot = currentRoute.startsWith("/vegs");
  //   final Color? textColor = isVegRoot ? Colors.blue : null;

  //   if (disease != null) {
  //     return InkWell(
  //       onTap: isVegRoot? () {
  //         Get.to(() => DiseaseScreen(), 
  //           arguments: disease, 
  //           binding: DiseaseBinding()
  //         );
  //       } : null,

  //       child: Card(
  //         child: Column(
  //           children: <Widget>[
  //             ClipRRect(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(10),
  //                 topRight: Radius.circular(10),
  //               ),
  //               child: Image.asset(
  //                 disease.photo,
  //                 fit: BoxFit.cover
  //               ),
  //             ),
  //             SizedBox(height: 16),
  //             Text(
  //               disease.name,
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       )

  //       Text(
  //         disease.name,
  //         style: TextStyle(color: textColor),
  //       ),
  //     );
  //   }
  //  return SizedBox();



// <Widget>[
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.teal[100],
//             child: const Text("He'd have you all unravel at the"),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.teal[200],
//             child: const Text('Heed not the rabble'),
//           ),
//         ],  