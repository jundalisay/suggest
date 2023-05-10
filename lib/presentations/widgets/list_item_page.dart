import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/controllers/base_list_item_controller.dart';

import 'package:suggest/controllers/carbon_list_controller.dart';
import 'package:suggest/models/carbon.dart';
import 'package:suggest/presentations/carbon_screen.dart';

class ListItemPage extends GetView<BaseListItemController> {
  ListItemPage(
      {Key? key,
      required this.title,
      required this.backIcon, required this.itemRoute})
      : super(key: key);

  final String title;
  final Icon backIcon;
  final String itemRoute;

  final TextEditingController _textEditingController = TextEditingController();

  // final controller = Get.find<BaseListItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: backIcon,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.indigo[50],
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Search"),
                          textAlignVertical: TextAlignVertical.bottom,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double itemWidth = (constraints.maxWidth - 16) / 3.0;
                  return Obx(
                    () => Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: controller.filteredItems.map((item) {
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
                                Get.toNamed(itemRoute, arguments: item);
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
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
