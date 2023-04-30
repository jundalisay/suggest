import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/navs/menu.dart';


class Index extends StatelessWidget {
  const Index({super.key});

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
      body: ListView(padding: EdgeInsets.all(8), children: <Widget>[
        Card(
          child: ListTile(
            title: Text('I have..',
              style: Theme.of(context).textTheme.headline1
            ),
            contentPadding: const EdgeInsets.all(6.0),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.toNamed("/diseases");
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              'I need..',
              style: Theme.of(context).textTheme.headline1
            ),
            contentPadding: const EdgeInsets.all(6.0),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {Get.toNamed("/vegs");},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Nutris',
                style: Theme.of(context).textTheme.displayLarge),
            contentPadding: const EdgeInsets.all(6.0),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {Get.toNamed("/nutris");},
          ),
        ),        
      ]),
    );

  }  
}

