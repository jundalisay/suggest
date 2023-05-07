import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/navs/menu.dart';




class Index extends StatelessWidget {
  const Index({super.key});

  final List<Map<String, dynamic>> items = const[
    const {'name': 'Diseases', 'photo': 'assets/diseases/cancer.jpg', 'route': '/diseases/'},
    const {'name': 'Healing Food', 'photo': 'assets/vegs/tomato.jpg', 'route': '/vegs/'},
    const {'name': 'Nutrition', 'photo': 'assets/vegs/ampalaya.jpg', 'route': '/nutris/'},    
    const {'name': 'Sellers', 'photo': 'assets/seller.jpg', 'route': '/sellers/'},
    const {'name': 'Practices', 'photo': 'assets/yoga.jpg', 'route': '/practices/'},
    const {'name': 'Carbon Reference', 'photo': 'assets/bicycle.jpg', 'route': '/carbons/'},    
    const {'name': 'Planetary Health Diet', 'photo': 'assets/phd.png', 'route': '/phds/'},        
  ];

  // final List<Item> items = [
  //   Item(name: '', photo: ''),
  //   Item(name: 'Food Cures', photo: '/assets/vegs/tomato.jpg'),
  //   Item(name: 'Nutrients', photo: '/assets/nutritions/vitc.jpg'),
  //   Item(name: 'Sellers', photo: '/assets/woman.jpg')
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
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(items[index]['route']);
              },
              child: Column(
                children: <Widget>[
                  Image.asset(items[index]['photo']),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      items[index]['name'],
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
    );

  }  
}

