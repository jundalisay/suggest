import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/bindings/disease_binder.dart';
import 'package:suggestion_app/controllers/veg_controller.dart';
import 'package:suggestion_app/models/disease.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/presentations/disease_screen.dart';

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
        padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(16.0),
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
                      'sdf',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
    debugPrint("VegScreen._foodWidget: currentRoute: $currentRoute");

    final bool isVegRoot = currentRoute.startsWith("/vegs");
    final Color? textColor = isVegRoot ? Colors.blue : null;

    if (disease != null) {
      return InkWell(
        onTap: isVegRoot
            ? () {
                Get.to(() => DiseaseScreen(),
                    arguments: disease, binding: DiseaseBinding());
              }
            : null,
        child: Text(
          disease.name,
          style: TextStyle(color: textColor),
        ),
      );
    }
    return SizedBox();
  }
}
