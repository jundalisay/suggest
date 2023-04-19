import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/nutri_list_controller.dart';
import 'package:suggestion_app/models/nutri.dart';
import 'package:suggestion_app/presentations/nutri_screen.dart';


class Nutris extends StatefulWidget {
  const Nutris({super.key});

  @override
  State<Nutris> createState() => _NutrisState();
}

class _NutrisState extends State<Nutris> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NutriListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutris"),
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
              () => controller.filteredNutris.isEmpty
                  ? const Text("No data")
                  : Column(
                      children: [
                        ...controller.filteredNutris
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

  Widget _information(BuildContext context, Nutri veg) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed("/vegs/veg", arguments: veg);
        },
        child: ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                veg.photo,
                fit: BoxFit.cover,
                width: 100.0,
              )),
          title: Text(veg.name),
          subtitle: Text(
            veg.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
