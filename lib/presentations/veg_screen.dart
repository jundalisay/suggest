import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class AppDimens {
  static const double menuMaxNeededWidth = 304;
  static const double menuRowHeight = 74;
  static const double menuIconSize = 36;
  static const double menuTextSize = 24;

  static const double chartBoxMinWidth = 350;

  static const double defaultRadius = 8;
  static const double chartSamplesSpace = 32.0;
  static const double chartSamplesMinWidth = 350;
}



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
                        child: Image.asset(
                          controller.veg!.photo,
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
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icons/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: AppColors.contentColorBlack,
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
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}





