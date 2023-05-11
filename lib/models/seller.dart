class Seller {
  String? id;
  String name;
  String photo;
  String description;
  String address;
  String email;
  String facebook;
  String instagram;
  String viber;      
  String website;
  String whatsapp;
  List<String>? phones;  
  List<String>? foods;

  Seller(this.id, this.name, this.photo, this.description, 
    this.address, this.email, this.facebook, this.instagram, 
    this.viber, this.website, this.whatsapp, this.phones, this.foods);

  factory Seller.fromJson(Map<dynamic, dynamic> json) => Seller(
    json["id"],
    json["name"],
    json["photo"],
    json["description"],
    json["address"],
    json["email"],
    json["facebook"],
    json["instagram"],
    json["viber"],
    json["website"],
    json["whatsapp"],                        
    (json["phones"] as List).map((e) => e.toString()).toList(),
    (json["foods"] as List).map((e) => e.toString()).toList()    
  );
}
