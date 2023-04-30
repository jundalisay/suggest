import 'package:flutter/material.dart';
import 'package:get/get.dart';


// import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:go_router/go_router.dart';



class Nutris extends StatelessWidget {
  const Nutris({Key? key}) : super(key: key);

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
      // backgroundColor: Colorshite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignmentBetween,
                    children: [
                      Text(
                        "Contacts",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // context.pop();
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 22),
                  TextFormField(
                    readOnly: true,
                    //false
                    autofocus: false,
                    // style: ,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: const Icon(Icons.search, color: Colors.black),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
                      hintText: "Contacts",
                      // hintStyle: textFieldPlaceholderTextStyle(context),
                      isDense: true,
                      filled: true,
                      // fillColor: ColorName.grayC4,
                      // focusedBorder: AppStyles.focusedTransparentBorder,
                      // disabledBorder: AppStyles.focusedTransparentBorder,
                      // enabledBorder: AppStyles.focusedTransparentBorder,
                      // errorBorder: AppStyles.focusedTransparentBorder,
                      // focusedErrorBorder: AppStyles.focusedTransparentBorder,
                      // errorStyle: errorTextStyle(context),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onSaved: (val) {},
                    onEditingComplete: () {},
                    onChanged: (val) {},
                    // validator: (val) {},
                    onTap: () {},
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Last Contacted",
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
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(24, 44, 26, 0),
                child: Text("asfAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontalAxis.horizontal"),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(24),
                //     topRight: Radius.circular(24),
                //   ),
                //   boxShadow: [
                //     BoxShadow(
                //       spreadRadius: 0,
                //       blurRadius: 8,
                //       offset: const Offset(0, -4), // changes position of shadow
                //     ),
                //   ],
                // ),
                // child: ListView.separated(
                //   itemCount: names.length,
                //   physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                //   itemBuilder: (c, i) {
                //     return SizedBox(
                //       width: 340,
                //       height: 60,
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           ClipRRect(
                //             borderRadius: BorderRadius.circular(8),
                //             child: Container(
                //               width: 60,
                //               height: 60,
                //               // margin: EdgeInsets.only(right: 14),
                //               // color: ColorName.grayC4,
                //             ),
                //           ),
                //           SizedBox(width: 14),
                //           Expanded(
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               // mainAxisAlignment: MainAxisAlignmentAround,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   mainAxisSize: MainAxisSize.max,
                //                   // mainAxisAlignment: MainAxisAlignmentaceBetween,
                //                   crossAxisAlignment: CrossAxisAlignment.end,
                //                   children: [
                //                     Expanded(
                //                       child: Text(
                //                         names[i],
                //                         style: GoogleFonts.lato(
                //                           textStyle: TextStyle(
                //                             fontSize: 16,
                //                             color: Colors.black,
                //                           ),
                //                         ),
                //                         maxLines: 1,
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                     ),
                //                     Text(
                //                       "14:23",
                //                       style: GoogleFonts.lato(
                //                         textStyle: TextStyle(
                //                           fontSize: 14,
                //                           color: const Color(0xffA8A8A8),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 3),
                //                 Text(
                //                   "Lorem Ipsum",
                //                   style: GoogleFonts.lato(
                //                     textStyle: TextStyle(
                //                       fontSize: 14,
                //                       color: Colors.black,
                //                       fontStyle: FontStyle.normal,
                //                     ),
                //                   ),
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   },
                  // separatorBuilder: (c, i) {
                  //   return SizedBox(height: 24);
                  // },
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:suggest/controllers/nutri_list_controller.dart';
// import 'package:suggest/models/nutri.dart';
// import 'package:suggest/presentations/nutri_screen.dart';


// class Nutris extends StatefulWidget {
//   const Nutris({super.key});

//   @override
//   State<Nutris> createState() => _NutrisState();
// }

// class _NutrisState extends State<Nutris> {
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<NutriListController>();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Nutris"),
//         centerTitle: true,
//       ),
//       // drawer: AppDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 10.0),
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
//               () => controller.filteredNutris.isEmpty
//                   ? const Text("No data")
//                   : Column(
//                       children: [
//                         ...controller.filteredNutris
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

//   Widget _information(BuildContext context, Nutri veg) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           Get.toNamed("/vegs/veg", arguments: veg);
//         },
//         child: ListTile(
//           leading: ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: Image.asset(
//                 veg.photo,
//                 fit: BoxFit.cover,
//                 width: 100.0,
//               )),
//           title: Text(veg.name),
//           subtitle: Text(
//             veg.description,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 3,
//           ),
//         ),
//       ),
//     );
//   }
// }
