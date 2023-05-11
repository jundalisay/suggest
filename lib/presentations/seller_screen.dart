import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:suggest/models/veg.dart';
import 'package:suggest/bindings/veg_binder.dart';
import 'package:suggest/controllers/veg_controller.dart';
import 'package:suggest/presentations/veg_screen.dart';

import 'package:suggest/models/seller.dart';
import 'package:suggest/bindings/seller_binder.dart';
import 'package:suggest/controllers/seller_controller.dart';
import 'package:suggest/presentations/seller_screen.dart';

import 'package:fl_chart/fl_chart.dart';



class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<StatefulWidget> createState() => SellerScreenState();
}

class SellerScreenState extends State {
  int touchedIndex = 0;

  final controller = Get.find<SellerController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[50],  
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(
          controller.seller?.name ?? "", 
          style: TextStyle(
            fontSize: 26,
            color: Colors.teal,
            fontWeight: FontWeight.bold, 
          )
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
                        child: Image.asset(controller.seller!.photo, fit: BoxFit.cover),
                      )
                    ),              
                    SizedBox(height: 12),
                    Text('Foods Sold'.tr, style: Theme.of(context).textTheme.headline2),                    
                    SizedBox(height: 8),
                    SizedBox(
                      height: 60,
                      width: 359,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.seller!.foods!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {      

                          final List<String> vegs = controller.seller!.foods!;
                          final Veg? veg = controller.getVeg(vegName: vegs[i]);

                          final currentRoute = Get.routing.current;
                          // debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");
                          // debugPrint("----------------------- $seller.photo");

                          // final bool isDiseaseRoot = currentRoute.startsWith("/vegs");
                          // final Color? textColor = isDiseaseRoot ? Colors.blue : null;

                          if (veg != null) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => VegScreen(), 
                                arguments: veg, binding: VegBinding());
                              },
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
                                          veg.photo,
                                          fit: BoxFit.cover,
                                        ),
                                      )               
                                  ],
                                ),
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
                          TableCell(child: Icon(Icons.mobile_friendly, color: Colors.teal)),
                          TableCell(child: Text('Whatsapp', style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.whatsapp.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.mobile_friendly, color: Colors.teal)),
                          TableCell(child: Text('Website', style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.website.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.mobile_friendly, color: Colors.teal)),
                          TableCell(child: Text('Viber', style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.viber.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.mobile_friendly, color: Colors.teal)),
                          TableCell(child: Text('Instagram'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.instagram.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.mobile_friendly, color: Colors.teal)),
                          TableCell(child: Text('Facebook'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.facebook.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),       
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.alternate_email, color: Colors.teal)),
                          TableCell(child: Text('Email'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.email.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),  
                      TableRow(
                        children: [
                          TableCell(child: Icon(Icons.map, color: Colors.teal)),
                          TableCell(child: Text('address'.tr, style: Theme.of(context).textTheme.headline6)),
                          TableCell(child: Text(controller.seller!.address.toString(), style: Theme.of(context).textTheme.headline6))
                        ],
                      ),
                    ],
                  ),
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
                        "Contact Numbers",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                      SizedBox(height: 8),                 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.seller!.phones?.map((phone) => 
                          Text(
                            '- $phone',
                            style: TextStyle(
                              fontSize: 18                   
                            ),
                          )
                        )
                        .toList() ??
                        [], // Displaying the symptoms of the first disease in the list
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
                      child: Text(controller.seller!.description, style: TextStyle(fontSize: 16)),
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