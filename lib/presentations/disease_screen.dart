import 'package:flutter/material.dart';
import 'package:suggestion_app/models/disease.dart';


class DiseaseScreen extends StatelessWidget {
  final Disease drug;
  const DiseaseScreen(this.drug, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drug.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(drug.photo),
            const SizedBox(height: 20,),
            Text(
              drug.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(drug.description),
            const SizedBox(height: 20.0),
            Text(
              "Suggested Food",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            ...drug.foods!.map((value) {

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