import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/disease_list_conrtoller.dart';
import 'package:suggestion_app/models/disease.dart';
import 'package:suggestion_app/presentations/disease_screen.dart';



class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiseaseListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diseases"),
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
              () => controller.filteredDiseases.isEmpty
                  ? const Text("No data")
                  : Column(
                      children: [
                        ...controller.filteredDiseases
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

  Widget _information(BuildContext context, Disease disease) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed("/diseases/disease", arguments: disease);
        },
        child: ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                disease.photo,
                fit: BoxFit.cover,
                width: 100.0,
              )),
          title: Text(disease.name),
          subtitle: Text(
            disease.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
