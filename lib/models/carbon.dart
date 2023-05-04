class Carbon {
  String? id;
  String name;
  String photo;
  String description;
  String impact;  
  List<String>? examples;

  Carbon(this.id, this.name, this.photo, this.description, this.impact, this.examples);

  factory Carbon.fromJson(Map<dynamic, dynamic> json) => Carbon(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    json["impact"],
    (json["examples"] as List).map((e) => e.toString()).toList(),
  );
}
