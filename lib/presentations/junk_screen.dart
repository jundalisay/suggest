// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:suggest/controllers/junk_controller.dart';
import 'package:suggest/models/junk.dart';
import 'package:suggest/models/disease.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/presentations/disease_screen.dart';



class JunkScreen extends StatefulWidget {
  const JunkScreen({super.key});

  @override
  State<StatefulWidget> createState() => JunkScreenState();
}

class JunkScreenState extends State {
  int touchedIndex = 0;

  final controller = Get.find<JunkController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[50],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.junk?.name ?? "",
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
                          controller.junk!.photo,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    AspectRatio(
                      aspectRatio: 1.3,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex =
                                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: showingSections(),
                          ),
                        ),
                      ),
                    ), 
                    Text(
                      "Known Diseases",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),          
                    SizedBox(height: 24),                              
                    SizedBox(
                      height: 60,
                      width: 359,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.junk!.diseases!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {      

                          final List<String> diseases = controller.junk!.diseases!;
                          final Disease? disease = controller.getDisease(diseaseName: diseases[i]);
                        // final Disease? disjease = controller.getDisease(diseaseName: "Cancer");

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
                    SizedBox(height: 24),
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
                                TableCell(child: Icon(Icons.local_fire_department, color: Colors.pink)),
                                TableCell(child: Text('Calories'.tr, style: Theme.of(context).textTheme.headline6)),
                                TableCell(child: Text(controller.junk!.calories.toString(), style: Theme.of(context).textTheme.headline6))
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(child: Icon(Icons.price_change, color: Colors.green)),                                  
                                TableCell(child: Text('Footprint', style: Theme.of(context).textTheme.headline6)),
                                TableCell(
                                  child: Text(
                                    controller.junk!.footprint.toString(),
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
                                    controller.junk!.sugar.toString(),
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
                                    controller.junk!.protein.toString(),
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
                                    controller.junk!.carbs.toString(),
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
                                    controller.junk!.water.toString(),
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
                                    controller.junk!.fiber.toString(),
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
                                    controller.junk!.fat.toString(),
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
                              controller.junk!.description,
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
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: controller.junk?.calories,
            title: controller.junk?.calories.toString(),
            radius: radius,
            badgeWidget: _Badge(
              'assets/protein.png',
              size: widgetSize,
              borderColor: Colors.indigo,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: controller.junk?.fat,
            title: controller.junk?.fat.toString(),
            radius: radius,
            badgeWidget: _Badge(
              'assets/fat.png',
              size: widgetSize,
              borderColor: Colors.orange,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: controller.junk?.fat,
            title: controller.junk?.fat.toString(),
            radius: radius,
            // titleStyle: TextStyle(
            //   fontSize: fontSize,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.purple,
            //   shadows: shadows,
            // ),
            badgeWidget: _Badge(
              'assets/cals.png',
              size: widgetSize,
              borderColor: Colors.red,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: controller.junk?.fiber,
            title: controller.junk?.fiber.toString(),
            radius: radius,
            badgeWidget: _Badge(
              'assets/carbs.png',
              size: widgetSize,
              borderColor: Colors.teal,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(
          svgAsset,
          fit: BoxFit.cover,
        ),        
        // child: SvgPicture.asset(
        //   svgAsset,
        // ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:suggest/controllers/junk_controller.dart';
// import 'package:suggest/models/junk.dart';



// class JunkScreen extends GetView<JunkController> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo[50],  
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.green),
//           onPressed: () => Navigator.of(context).pop(),
//         ),         
//         title: Text(controller.junk?.name ?? "",
//           style: TextStyle(color: Colors.green),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView( 
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         child: Image.asset(
//                           controller.junk!.photo,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.all(8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ), 
//                 child: Padding(
//                   padding: EdgeInsets.all(8),                
//                   child: Table(
//                     columnWidths: {
//                       0: FlexColumnWidth(1),
//                       1: FlexColumnWidth(2),
//                       2: FlexColumnWidth(4),
//                     },
//                   ),
//                 ),                                                                   
//               ),
//               Container(
//                 margin: EdgeInsets.all(8),
//                 child: Card(
//                   // shape: RoundedRectangleBorder(
//                   //   borderRadius: BorderRadius.circular(8.0),
//                   // ),
//                   child: Padding(
//                     padding: EdgeInsets.all(8),             
//                     child: Container(
//                       // height: MediaQuery.of(context).size.height - 20,
//                       width: MediaQuery.of(context).size.width - 20,
//                       child: Text(
//                         controller.junk!.description,
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),                            
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





