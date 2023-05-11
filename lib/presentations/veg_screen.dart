import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';

import 'package:fl_chart/fl_chart.dart';



class VegScreen extends StatefulWidget {
  const VegScreen({super.key});

  @override
  State<StatefulWidget> createState() => VegScreenState();
}

class VegScreenState extends State {
  int touchedIndex = 0;

  final controller = Get.find<VegController>();

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
                        borderRadius: BorderRadius.circular(10),
                        //   topLeft: Radius.circular(10),
                        //   topRight: Radius.circular(10),
                        // ),
                        child: Image.asset(controller.veg!.photo, fit: BoxFit.cover),
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
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: showingSections(),
                          ),
                        ),
                      ),
                    ),
                    Text('Suggested Ailments'.tr, style: Theme.of(context).textTheme.headline5),                    
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

                          final currentRoute = Get.routing.current;
                          // debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");
                          debugPrint("----------------------- $disease.photo");

                          final bool isDiseaseRoot = currentRoute.startsWith("/diseases");
                          final Color? textColor = isDiseaseRoot ? Colors.blue : null;

                          if (disease != null) {
                            return InkWell(
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
                          return SizedBox(width: 16);
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
                          TableCell(child: Icon(Icons.local_fire_department, color: Colors.green)),
                          TableCell(child: Text('Calories'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.calories.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.ramen_dining, color: Colors.green)),
                          TableCell(child: Text('Price'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.price.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.icecream, color: Colors.green)),
                          TableCell(child: Text('Sugar'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.sugar.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.set_meal, color: Colors.green)),
                          TableCell(child: Text('Protein'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.protein.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.ramen_dining, color: Colors.green)),
                          TableCell(child: Text('Carbs'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.carbs.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.water_drop, color: Colors.green)),
                          TableCell(child: Text('Water'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.water.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),       
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.dinner_dining, color: Colors.green)),
                          TableCell(child: Text('Fiber'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.fiber.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),  
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.lunch_dining, color: Colors.green)),
                          TableCell(child: Text('Fat'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.veg!.fat.toString(), style: Theme.of(context).textTheme.headline6))
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
                      child: Text(controller.veg!.description, style: TextStyle(fontSize: 16)),
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
            value: controller.veg?.calories,
            title: controller.veg?.calories.toString(),
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
            value: controller.veg?.fat,
            title: controller.veg?.fat.toString(),
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
            value: controller.veg?.fat,
            title: controller.veg?.fat.toString(),
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
            value: controller.veg?.fiber,
            title: controller.veg?.fiber.toString(),
            radius: radius,
            badgeWidget: _Badge(
              'assets/carbs.png',
              size: widgetSize,
              borderColor: Colors.teal,
            ),
            badgePositionPercentageOffset: .98,
          );
        default: throw Exception('Oh no');
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
        border: Border.all(color: borderColor, width: 2),
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
