import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/navs/menu.dart';




class Index extends StatelessWidget {
  const Index({super.key});

  // final List<Map<String, dynamic>> items = const[
  //   const {'name': 'Diseases', 'photo': 'assets/diseases/cancer.jpg', 'route': '/diseases/'},
  //   const {'name': 'Healing Food', 'photo': 'assets/vegs/tomato.jpg', 'route': '/vegs/'},
  //   const {'name': 'Nutrition', 'photo': 'assets/vegs/ampalaya.jpg', 'route': '/nutris/'},    
  //   const {'name': 'Sellers', 'photo': 'assets/seller.jpg', 'route': '/sellers/'},
  //   const {'name': 'Practices', 'photo': 'assets/yoga.jpg', 'route': '/practices/'},
  //   const {'name': 'Carbon Reference', 'photo': 'assets/bicycle.jpg', 'route': '/carbons/'},    
  //   const {'name': 'Planetary Health Diet', 'photo': 'assets/phd.png', 'route': '/phds/'},        
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],

      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.dehaze,
              ),
              color: Colors.indigo,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),         
        title: Text("Suggest",
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      drawer: Menu(),
      body: GridView.count(
        crossAxisCount: 2, // 2 cards per row
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/diseases');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/diseases/cancer.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Diseases'.tr,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/carbons');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/unhealthy/lechon.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Unhealthy Foods'.tr,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),          
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/vegs');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/vegs/ampalaya.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('Healing Foods'.tr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/nutris');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/vegs/tomato.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Nutrients'.tr,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
          ),          
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/diseases');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/yoga.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Healthy Practices'.tr,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
          ),          
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/carbons');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/phd.png"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Planetary Health Diet',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed('/carbons');
              },
              child: Column(
                children: <Widget>[
                  Image.asset("assets/bicycle.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Carbon Reference'.tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),            
          ),          
        ],
      ),
    );
  }  
}


      // body: GridView.builder(
      //   itemCount: items.length,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 1,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return Card(
      //       margin: EdgeInsets.all(8.0),
      //       child: InkWell(
      //         onTap: () {
      //           Get.toNamed(items[index]['route']);
      //         },
      //         child: Column(
      //           children: <Widget>[
      //             Image.asset(items[index]['photo']),
      //             Padding(
      //               padding: EdgeInsets.symmetric(horizontal: 12.0),
      //               child: Text(
      //                 items[index]['name'],
      //                 style: TextStyle(
      //                   color: Colors.indigo[900],
      //                   fontSize: 24,
      //                   fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
      // ListView(padding: EdgeInsets.all(8), children: <Widget>[
      //   Card(
      //     child: ListTile(
      //       title: Text('Diseases',
      //         style: Theme.of(context).textTheme.headline1
      //       ),
      //       contentPadding: const EdgeInsets.all(6.0),
      //       trailing: const Icon(Icons.keyboard_arrow_right),
      //       onTap: () {
      //         Get.toNamed("/diseases");
      //       },
      //     ),
      //   ),
      //   Card(
      //     child: ListTile(
      //       title: Text(
      //         'Food',
      //         style: Theme.of(context).textTheme.headline1
      //       ),
      //       contentPadding: const EdgeInsets.all(6.0),
      //       trailing: const Icon(Icons.keyboard_arrow_right),
      //       onTap: () {Get.toNamed("/vegs");},
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       height: 1.0,
      //       color: Colors.grey,
      //     ),
      //   ),
      //   Card(
      //     child: ListTile(
      //       title: Text('Nutrients',
      //           style: Theme.of(context).textTheme.displayLarge),
      //       contentPadding: const EdgeInsets.all(6.0),
      //       trailing: const Icon(Icons.keyboard_arrow_right),
      //       onTap: () {Get.toNamed("/nutris");},
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       height: 1.0,
      //       color: Colors.grey,
      //     ),
      //   ),
      //   Card(
      //     child: ListTile(
      //       title: Text('Food Retailers',
      //         style: Theme.of(context).textTheme.displayLarge
      //       ),
      //       contentPadding: const EdgeInsets.all(6.0),
      //       trailing: const Icon(Icons.keyboard_arrow_right),
      //       onTap: () {Get.toNamed("/nutris");},
      //     ),
      //   ),                
      // ]),
