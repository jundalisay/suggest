import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/veg_controller.dart';
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
    final controller = Get.find<VegController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegs"),
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VegScreen(veg),
            ),
          );
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
