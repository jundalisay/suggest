import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/disease_conrtoller.dart';

class DiseaseScreen extends GetView<DiseaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.disease?.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            if (controller.disease != null)
              Image.asset(controller.disease!.photo),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.disease?.name ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(controller.disease?.description ?? ""),
            const SizedBox(height: 20.0),
            Text(
              "Suggested Food",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.disease != null)
              ...controller.disease!.foods!.map((value) {
                // how to show a card that has a the details of the veg which will open to the Veg Screen of that veg?  link that

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, textAlign: TextAlign.left),
                    SizedBox(height: 10.0)
                  ],
                );
              }),
          ],
        ),
      ),
    );
  }

  _listItems(items) {
    return items.forEach((item) => Text(item));
  }
}
