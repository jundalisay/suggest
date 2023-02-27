import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/controllers/veg_controller.dart';
import 'package:suggestion_app/models/veg.dart';

class VegScreen extends GetView<VegController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.veg?.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            if (controller.veg != null) Image.asset(controller.veg!.photo),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.veg?.name ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(controller.veg?.description ?? ""),
            const SizedBox(height: 20.0),
            Text(
              "Suppliers",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.veg != null)
              ...controller.veg!.stores!.map((value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value, textAlign: TextAlign.left),
                    SizedBox(height: 10.0)
                  ],
                );
              }),
            const SizedBox(height: 20.0),
            Text(
              "Good Against",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.veg != null)
              ...controller.veg!.diseases!.map((value) {
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
