import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/bindings/veg_binder.dart';
import 'package:suggest/controllers/nutri_controller.dart';
import 'package:suggest/models/veg.dart';
import 'package:suggest/presentations/veg_screen.dart';


class NutriScreen extends GetView<NutriController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.nutri?.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            if (controller.nutri != null)
              Image.asset(controller.nutri!.photo),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.nutri?.name ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(controller.nutri?.description ?? ""),
            const SizedBox(height: 20.0),
            Text(
              "Nutrients",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            // if (controller.nutri != null)
            //   ...controller.nutri!.foods!.map((value) {
            //     // how to show a card that has a the details of the veg which will open to the Nutri Screen of that veg?  link that

            //     return _foodWidget(context, vegName: value);
            //   }),
          ],
        ),
      ),
    );
  }

 Widget _foodWidget(BuildContext context, {required String vegName}) {
    final Veg? veg = controller.getVeg(vegName: vegName);

    final currentRoute = Get.routing.current;
    debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");

    final bool isDiseaseRoot = currentRoute.startsWith("/nutris");
    final Color? textColor = isDiseaseRoot ? Colors.blue : null;

    if (veg != null) {
      return InkWell(
        onTap: isDiseaseRoot
            ? () {
                Get.to(() => VegScreen(),
                    arguments: veg, binding: VegBinding());
              }
            : null,
        child: Text(
          veg.name,
          style: TextStyle(color: textColor),
        ),
      );
    }
    return SizedBox();
  }
}
