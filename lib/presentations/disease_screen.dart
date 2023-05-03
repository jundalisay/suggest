import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/bindings/veg_binder.dart';
import 'package:suggest/controllers/disease_controller.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/models/disease.dart';
import 'package:suggest/presentations/veg_screen.dart';


class DiseaseScreen extends GetView<DiseaseController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),         
        title: Text(controller.disease?.name ?? "",
          style: TextStyle(color: Colors.red),
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
                          controller.disease!.photo,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Suggested Foods",
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
                        itemCount: controller.disease!.foods!.length,
                        // itemCount: 10,
                        itemBuilder: (c, i) {      

                          final List<String> vegs = controller.disease!.foods!;
                          final Veg? veg = controller.getVeg(vegName: vegs[i]);

                          final currentRoute = Get.routing.current;
                          debugPrint("----------------------- $veg.photo");

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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        veg.photo,
                                        fit: BoxFit.cover,
                                      ),
                                      // child: Text(disease.name)
                                    ),                                
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.disease!.symptoms?.map((symptom) => Text('- $symptom'))
                      .toList() ??
                      [], // Displaying the symptoms of the first disease in the list
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
                        controller.disease!.description,
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






//       appBar: AppBar(
//         title: Text(controller.disease?.name ?? ""),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             if (controller.disease != null)
//               Image.asset(controller.disease!.photo),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               controller.disease?.name ?? "",
//               style: Theme.of(context).textTheme.headline1,
//             ),
//             const SizedBox(height: 10),
//             Text(controller.disease?.description ?? ""),
//             const SizedBox(height: 20.0),
//             Text(
//               "Suggested Food",
//               style: Theme.of(context).textTheme.headline3,
//             ),
//             const SizedBox(height: 10),
//             if (controller.disease != null)
//               ...controller.disease!.foods!.map((value) {
//                 // how to show a card that has a the details of the disease which will open to the Veg Screen of that disease?  link that

//                 return _foodWidget(context, diseaseName: value);
//               }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _foodWidget(BuildContext context, {required String diseaseName}) {
//     final Veg? disease = controller.getVeg(diseaseName: diseaseName);

//     final currentRoute = Get.routing.current;
//     debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");

//     final bool isDiseaseRoot = currentRoute.startsWith("/diseases");
//     final Color? textColor = isDiseaseRoot ? Colors.blue : null;

//     if (disease != null) {
//       return InkWell(
//         onTap: isDiseaseRoot
//             ? () {
//                 Get.to(() => VegScreen(),
//                     arguments: disease, binding: VegBinding());
//               }
//             : null,
//         child: Text(
//           disease.name,
//           style: TextStyle(color: textColor),
//         ),
//       );
//     }
//     return SizedBox();
//   }
// }
