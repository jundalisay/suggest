class Nutri {
  String? id;
  String name;
  String photo;
  String description;
  List<String>? sources;
  List<String>? functions;
  List<String>? deficiencies;

  Nutri(this.id, this.name, this.photo, this.description, 
    this.sources, this.functions, this.deficiencies
  );

  factory Nutri.fromJson(Map<dynamic, dynamic> json) => Nutri(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    (json["sources"] as List).map((e) => e.toString()).toList(),
    (json["functions"] as List).map((e) => e.toString()).toList(),
    (json["deficiencies"] as List).map((e) => e.toString()).toList()      
  );
}
