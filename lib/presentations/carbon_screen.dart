import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/controllers/carbon_controller.dart';
import 'package:suggest/models/carbon.dart';



class CarbonScreen extends GetView<CarbonController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.carbon?.name ?? "",
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
                          controller.carbon!.photo,
                          fit: BoxFit.cover,
                        ),
                      )
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
                        controller.carbon!.description,
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





