import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/models/nutri.dart';
import 'package:suggest/controllers/nutri_controller.dart';

// import 'package:suggest/models/veg.dart';
// import 'package:suggest/bindings/veg_binder.dart';
// import 'package:suggest/presentations/veg_screen.dart';

import 'package:suggest/models/disease.dart';
import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/presentations/disease_screen.dart';


// import 'package:suggest/bindings/nutri_binder.dart';
// import 'package:suggest/presentations/nutri_screen.dart';



class NutriScreen extends GetView<NutriController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.nutri?.name ?? "",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          controller.nutri!.photo,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Deficiencies",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 60,
                      width: 359,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.nutri!.deficiencies!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {      

                          final List<String> deficiencies = controller.nutri!.deficiencies!;
                          final Disease? disease = controller.getDisease(diseaseName: deficiencies[i]);

                          final currentRoute = Get.routing.current;
                          debugPrint("----------------------- $deficiencies[i]");
                          debugPrint("----------------------- $disease.photo");

                          // final bool isDiseaseRoot = currentRoute.startsWith("/vegs");
                          // final Color? textColor = isDiseaseRoot ? Colors.blue : null;

                          if (disease != null) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => DiseaseScreen(), 
                                arguments: disease, binding: DiseaseBinding());
                              },
                              child: SizedBox(
                                width: 59,
                                height: 59,
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        disease.photo,
                                        fit: BoxFit.cover,
                                      ),
                                      // child: Text(nutri.name)
                                    ),                                
                                  ],
                                ),
                              // );
                              // Text(
                              //   nutri.name,
                              //   style: TextStyle(color: textColor),
                              ),
                            );
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Symptoms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                      SizedBox(height: 8),                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.nutri!.functions?.map((function) => 
                          Text(
                            '- $function',
                            style: TextStyle(
                              fontSize: 18                   
                            ),
                          )
                        )
                        .toList() ??
                        [], // Displaying the symptoms of the first in the list
                      )
                    ]
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Card(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.all(8),             
                    child: Container(
                      // height: MediaQuery.of(context).size.height - 20,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(
                        controller.nutri!.description,
                        style: TextStyle(
                          fontSize: 18,
                        ),                       
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

