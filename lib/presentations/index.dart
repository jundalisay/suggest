import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Card(
          child: ListTile(
            title: Text('I have..',
                style: Theme.of(context).textTheme.displayLarge),
            contentPadding: const EdgeInsets.all(6.0),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.toNamed("/diseases");
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('I need..',
                style: Theme.of(context).textTheme.displayLarge),
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
            title: Text('Demo',
                style: Theme.of(context).textTheme.displayLarge),
            contentPadding: const EdgeInsets.all(6.0),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {Get.toNamed("/demo");},
          ),
        ),        
      ]),
    );
  }
}