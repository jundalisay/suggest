# suggestion_app



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
                return _diseaseWidget(context, diseaseName: value);
              }),
          ],
        ),




      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 16,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          Get.toNamed("/vegs/veg", arguments: veg);
        },
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                veg.photo,
                fit: BoxFit.cover,
                width: 100,
                height: double.infinity,
              ),
            ),
          ),
          title: Text(veg.name),
          subtitle: Text(
            veg.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
