import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/veg_list_controller.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/veg_screen.dart';



class Item {
  final String name;
  final String photo;

  Item({required this.name, required this.photo});
}



class Vegs extends StatelessWidget {
  Vegs({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  final controller = Get.find<VegListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables',
          style: Theme.of(context).textTheme.headline5
        ),
        centerTitle: true,    
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),  
      backgroundColor: Colors.indigo[50],           
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: (_) {
                            controller.onSearchChanged(value: _);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, 
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),), hintText: "Search"
                          ),                          
                          textAlignVertical: TextAlignVertical.bottom,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double itemWidth = (constraints.maxWidth - 16 ) / 3.0;
                    return Obx(
                      () => Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: controller.filteredVegs.map((item) {
                          return SizedBox(
                            width: itemWidth,
                            child: Card(
                              elevation: 4,
                              // shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ), 
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed("/vegs/veg", arguments: item);
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: Image.asset(
                                        item.photo,
                                        fit: BoxFit.cover,
                                        // height: 150.0,
                                      ),
                                    ),                                    
                                    SizedBox(height: 8.0),
                                    Text(
                                      item.name,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//                     return Wrap(
//                       spacing: 8.0,
//                       runSpacing: 8.0,



//   Column(
//                       children: [
//                         ...controller.filteredVegs
//                             .map((element) => _information(context, element))
//                             .toList(),
//                       ],
//                     ),
//             ),

// Obx(() => controller.filteredVegs.isEmpty? const Text("No data"): 
//                       children: items.map((item) {
//                         return SizedBox(
//                           width: itemWidth,
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   item.photo,
//                                   fit: BoxFit.cover,
//                                   // height: 150.0,
//                                 ),
//                                 SizedBox(height: 8.0),
//                                 Text(
//                                   item.name,
//                                   style: TextStyle(fontSize: 18.0),
//                                 ),
//                                 SizedBox(height: 8.0),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     );




// class Vegs extends StatefulWidget {
//   const Vegs({super.key});

//   @override
//   State<Vegs> createState() => _VegsState();
// }

// class _VegsState extends State<Vegs> {
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<VegListController>();
//     return Scaffold(

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       height: 30,
//                       child: TextField(
//                         controller: _textEditingController,
//                         onChanged: (_) {
//                           controller.onSearchChanged(value: _);
//                         },
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(), hintText: "Search"),
//                         textAlignVertical: TextAlignVertical.bottom,
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Obx(
//               () => controller.filteredVegs.isEmpty
//                   ? const Text("No data")
//                   : Column(
//                       children: [
//                         ...controller.filteredVegs
//                             .map((element) => _information(context, element))
//                             .toList(),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _information(BuildContext context, Veg veg) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 16,
//       shadowColor: Colors.grey,
//       child: InkWell(
//         onTap: () {
//           Get.toNamed("/vegs/veg", arguments: veg);
//         },
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                 ),
//                 child: Image.asset(
//                   veg.photo,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       veg.name,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       veg.description,
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Icon(Icons.star),
//                         Text('Rating: 4.5'),
//                         Icon(Icons.star),
//                         Text('Rating: 5'),                        
//                       ],
//                     ),                                        
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
