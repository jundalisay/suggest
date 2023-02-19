class Disease {
  // final? id;
  // final? name;
  // final? photo;
  // final? description;
  // final? symptoms;
  // final? causes;
  // final? dos;
  // final? donts;
  // final? preventions;
  // final? remedies;
  String? id;
  String name;
  String photo;
  String description;
  List<String>? symptoms;
  List<String>? causes;
  List<String>? dos;
  List<String>? donts;
  List<String>? preventions;
  List<String>? remedies;

  Disease(this.id, this.name, this.photo, this.description, this.symptoms, this.causes, this.dos, this.donts, this.preventions, this.remedies);

  factory Disease.fromJson(Map<dynamic, dynamic> json) => Disease(
      json["id"],
      json["name"],
      json["photo"],
      json["description"],
      (json["symptoms"] as List).map((e) => e.toString()).toList() ,
      (json["causes"] as List).map((e) => e.toString()).toList(),
      (json["dos"] as List).map((e) => e.toString()).toList(),
      (json["donts"] as List).map((e) => e.toString()).toList(),
      (json["preventions"] as List).map((e) => e.toString()).toList(),
      (json["remedies"] as List).map((e) => e.toString()).toList()
  );
}