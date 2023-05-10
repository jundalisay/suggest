class Junk {
  String? id;
  String name;
  String photo;
  String description;
  double calories;
  double water;    
  double protein;    
  double carbs;    
  double sugar;    
  double fiber;    
  double fat;
  double footprint;
  List<String>? diseases;
  List<String>? examples;
  List<String>? alternatives;

  Junk(this.id, this.name, this.photo, this.description, 
    this.calories, this.water, this.protein, this.carbs, 
    this.sugar, this.fiber, this.fat, this.footprint, 
    this.diseases, this.examples, this.alternatives);

  factory Junk.fromJson(Map<dynamic, dynamic> json) => Junk(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    json["calories"],
    json["water"],
    json["protein"],
    json["carbs"],
    json["sugar"],
    json["fiber"],
    json["fat"],        
    json["footprint"],
    (json["diseases"] as List).map((e) => e.toString()).toList(),
    (json["examples"] as List).map((e) => e.toString()).toList(),
    (json["alternatives"] as List).map((e) => e.toString()).toList()    
  );
}
