class Nutri {
  String? id;
  String name;
  String photo;
  String description;
  String price;  
  List<String>? diseases;
  List<String>? stores;

  Nutri(this.id, this.name, this.photo, this.description, this.price, this.diseases, this.stores);

  factory Nutri.fromJson(Map<dynamic, dynamic> json) => Nutri(
      json["id"],
      json["name"],
      json["photo"],
      json["description"],
     json["price"],      
      (json["diseases"] as List).map((e) => e.toString()).toList(),
      (json["stores"] as List).map((e) => e.toString()).toList()
  );
}
