import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';



class VegScreen extends GetView<VegController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.veg?.name ?? "",
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
                          controller.veg!.photo,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Suggested Ailments",
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
                        itemCount: controller.veg!.diseases!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {      

                          final List<String> diseases = controller.veg!.diseases!;
                          final Disease? disease = controller.getDisease(diseaseName: diseases[i]);
                          // final Disease? disease = controller.getDisease(diseaseName: "Cancer");

                          final currentRoute = Get.routing.current;
                          // debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");
                          debugPrint("----------------------- $disease.photo");

                          final bool isDiseaseRoot = currentRoute.startsWith("/diseases");
                          final Color? textColor = isDiseaseRoot ? Colors.blue : null;

                          if (disease != null) {
                            return InkWell(
                              // onTap: isDiseaseRoot ? () {
                              // } : null,
                              onTap: () {
                                Get.to(() => DiseaseScreen(), 
                                arguments: disease, binding: DiseaseBinding());
                              },
                              // onTap: isDiseaseRoot ? () {
                              //   Get.to(() => DiseaseScreen(), 
                              //   arguments: disease, binding: DiseaseBinding());
                              // } : null,
                              child: SizedBox(
                                width: 59,
                                height: 59,
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    // Positioned(
                                    //   left: 0,
                                    //   top: 0,
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          disease.photo,
                                          fit: BoxFit.cover,
                                        ),
                                        // child: Text(disease.name)
                                      )                                  
                                    // ),
                                    // Positioned(
                                    //   right: 0,
                                    //   bottom: 0,
                                    //   child: Container(
                                    //     width: 18,
                                    //     height: 18,
                                    //     decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(18),
                                    //       color: Colors.red,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              // );
                              // Text(
                              //   disease.name,
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
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), 
                child: Padding(
                  padding: EdgeInsets.all(8),                
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(4),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.local_fire_department,
                              color: Colors.pink,
                            ),
                          ),
                          TableCell(
                            child: Text(
                              'Calories',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.calories,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.price_change,
                              color: Colors.green,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.price,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.icecream,
                              color: Colors.cyan,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Sugar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.sugar,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.set_meal,
                              color: Colors.deepOrange[800],
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Protein',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.protein,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.ramen_dining,
                              color: Colors.orange,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Carbs',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.carbs,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.water_drop,
                              color: Colors.blue,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Water',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.water,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),       
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.dinner_dining,
                              color: Colors.green,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Fiber',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.fiber,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),  
                      TableRow(
                        children: [
                          TableCell(
                            child: Icon(
                              Icons.lunch_dining,
                              color: Colors.red,
                            ),
                          ),                                  
                          TableCell(
                            child: Text(
                              'Fat',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              controller.veg!.fat,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                        controller.veg!.description,
                        style: TextStyle(
                          fontSize: 16,
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





