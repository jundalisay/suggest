import 'package:flutter/material.dart';
import 'package:suggestion_app/models/veg.dart';


class VegScreen extends StatelessWidget {
  final Veg veg;
  const VegScreen(this.veg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(veg.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(veg.photo),
            const SizedBox(height: 20,),
            Text(
              veg.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(veg.description),
            const SizedBox(height: 20.0),
            Text(
              "Suggested Food",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            ...veg.stores!.map((value) {
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