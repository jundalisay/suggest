import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/veg_list_controller.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/presentations/veg_screen.dart';

class Vegs extends StatefulWidget {
  const Vegs({super.key});

  @override
  State<Vegs> createState() => _VegsState();
}

class _VegsState extends State<Vegs> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VegListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegs"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      // drawer: AppDrawer(),
      body: SingleChildScrollView(
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
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Search"),
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => controller.filteredVegs.isEmpty
                  ? const Text("No data")
                  : Column(
                      children: [
                        ...controller.filteredVegs
                            .map((element) => _information(context, element))
                            .toList(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _information(BuildContext context, Veg veg) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 16,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          Get.toNamed("/vegs/veg", arguments: veg);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  veg.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      veg.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      veg.description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text('Rating: 4.5'),
                        Icon(Icons.star),
                        Text('Rating: 5'),                        
                      ],
                    ),                                        
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

