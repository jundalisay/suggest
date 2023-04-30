import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/disease_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class VegScreen extends GetView<VegController> {

  static const List<String> names = [
    "Justin Wan",
    "Eathan Kwan",
    "Tannzz Wan",
    "Cecily Wan",
    "Oscar Wan",
    "Bukunmi Aluko",
    "John Doe",
    "Lorem Master",
    "Elon Musk",
    "Bill Gates",
    "Jeff Bezos"
  ];
  
  @override
  Widget build(BuildContext context) {
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
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 60,
                      width: 359,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: names.length,
                        itemBuilder: (c, i) {
                          return SizedBox(
                            width: 59,
                            height: 59,
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
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




              Table(
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
              SizedBox(height: 16),
              Container(
                child: Text(
                  controller.veg!.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),                            
                ),
              ),         
              SizedBox(height: 16)                                                                                                           
            ],
          ),
        ),
      ),
    );
  }
}





