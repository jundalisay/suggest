import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/controllers/junk_list_controller.dart';
import 'package:suggest/models/junk.dart';
import 'package:suggest/presentations/junk_screen.dart';



class Junks extends StatelessWidget {
  Junks({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  final controller = Get.find<JunkListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Unhealthy Foods'.tr,
          style: Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,    
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),        
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
                        children: controller.filteredJunks.map((item) {
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
                                  Get.toNamed("/junks/junk", arguments: item);
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
