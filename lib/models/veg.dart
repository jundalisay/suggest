class Veg {
  String? id;
  String name;
  String photo;
  String description;
  String price;  

  String calories;
  String water;
  String protein;
  String carbs;
  String sugar;
  String fiber;
  String fat;

  List<String>? diseases;
  List<String>? stores;
  List<String>? subpics;  

  Veg(this.id, this.name, this.photo, this.description, this.price, 
    this.calories, this.water, this.protein, this.carbs, this.sugar,
    this.fiber, this.fat,
    this.diseases, this.stores, this.subpics
  );

  factory Veg.fromJson(Map<dynamic, dynamic> json) => Veg(
      json["id"],
      json["name"],
      json["photo"],
      json["description"],
      json["price"],      

      json["calories"],      
      json["water"],      
      json["protein"],      
      json["carbs"],      
      json["sugar"],      
      json["fiber"],      
      json["fat"],      

      (json["diseases"] as List).map((e) => e.toString()).toList(),
      (json["stores"] as List).map((e) => e.toString()).toList(),
      (json["subpics"] as List).map((e) => e.toString()).toList()      
  );
}
