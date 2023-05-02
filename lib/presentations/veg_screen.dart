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
                    Text(
                      "Suggested Diseases",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 60,
                      width: 359,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.veg!.diseases!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {         

                          final Disease? disease = controller.getDisease(diseaseName: controller.veg!.diseases);

                          final currentRoute = Get.routing.current;
                          // debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");

                          final bool isDiseaseRoot = currentRoute.startsWith("/diseases");
                          final Color? textColor = isDiseaseRoot ? Colors.blue : null;

                          if (disease != null) {
                            return InkWell(
                              onTap: isDiseaseRoot
                                ? () {
                                    Get.to(() => DiseaseScreen(),
                                        arguments: disease, binding: DiseaseBinding());
                                  }
                                : null,
                              child: Text(
                                "veg.name",
                                style: TextStyle(color: textColor),
                              ),
                            );
                          }
                          // return SizedBox(
                          //   width: 59,
                          //   height: 59,
                          //   child: Stack(
                          //     fit: StackFit.loose,
                          //     children: [
                          //       Positioned(
                          //         left: 0,
                          //         top: 0,
                          //         child: ClipRRect(
                          //           borderRadius: BorderRadius.circular(8),
                          //           // child: Image.asset(
                          //           //   controller.veg!.diseases![2],
                          //           //   fit: BoxFit.cover,
                          //           // ),
                          //           child: Text(controller.veg!.diseases![0])
                          //         )                                  
                          //       ),
                          //       Positioned(
                          //         right: 0,
                          //         bottom: 0,
                          //         child: Container(
                          //           width: 18,
                          //           height: 18,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(18),
                          //             color: Colors.red,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // );
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
                            Icons.access_time,
                            color: Colors.pink,
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
                            Icons.thermostat,
                            color: Colors.teal,
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Daytime Temperature',
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
                            Icons.thermostat,
                            color: Colors.teal,
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Nighttime Temperature',
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
                            Icons.bubble_chart,
                            color: Colors.deepOrange[800],
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Soil Type',
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
                            Icons.water,
                            color: Colors.orange,
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Water Needs',
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
                            'pH',
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
                            Icons.whatshot,
                            color: Colors.green,
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Nitrogen',
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
                            Icons.whatshot,
                            color: Colors.green,
                          ),
                        ),                                  
                        TableCell(
                          child: Text(
                            'Phosphorus',
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
              Container(
                margin: EdgeInsets.all(8),
                child: Card(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.all(8),                  
                    child: Container(
                      height: MediaQuery.of(context).size.height - 20,
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





