import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/disease_list_controller.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/presentations/disease_screen.dart';



class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.find<DiseaseListController>();
    
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Diseases'.tr,
          style: Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,    
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.of(context).pop(),
        ),        
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.plus_one, color: Colors.black),
        //     onPressed: () {
        //       // if (controller.tasks.isNotEmpty) {
        //       //   Get.to(() => AddDialog(), transition: Transition.downToUp);
        //       // } else {
        //       //   EasyLoading.showInfo('Please show your task type');
        //       // }
        //     },
        //   )
        // ],
      ),      
      // drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                        children: controller.filteredDiseases.map((item) {
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
                                  Get.toNamed("/diseases/disease", arguments: item);
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


//               Obx(
//                 () => controller.filteredDiseases.isEmpty
//                 ? const Text("No data"): Column(
//                   children: [
//                     ...controller.filteredDiseases
//                       .map((element) => _information(context, element))
//                       .toList(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _information(BuildContext context, Disease disease) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           Get.toNamed("/diseases/disease", arguments: disease);
//         },
//         child: ListTile(
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(5),
//             child: Image.asset(
//               disease.photo,
//               fit: BoxFit.cover,
//               width: 100.0,
//             )
//           ),
//           title: Text(disease.name),
//           subtitle: Text(
//             disease.description,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 3,
//           ),
//         ),
//       ),
//     );
//   }
// }
