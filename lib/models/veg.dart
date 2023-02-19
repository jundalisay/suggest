class Veg {
  String? id;
  String name;
  String photo;
  String description;
  String price;  
  List<String>? precautions;
  List<String>? stores;

  Veg(this.id, this.name, this.photo, this.description, this.price, this.precautions, this.stores);

  factory Veg.fromJson(Map<dynamic, dynamic> json) => Veg(
      json["id"],
      json["name"],
      json["photo"],
      json["description"],
     json["price"],      
      (json["precautions"] as List).map((e) => e.toString()).toList() ,
      (json["stores"] as List).map((e) => e.toString()).toList()
  );
}
