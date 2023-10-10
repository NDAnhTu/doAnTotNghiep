class ShopDataModel {
  String? id;
  String? description;
  String? name;
  String? rating;
  String? city;
  String? address;

  ShopDataModel({
    this.name,
    this.rating,
  });

  ShopDataModel.fromJson(Map<String, dynamic> json) {
    description   = json["description"];
    name          = json["name"];
    rating        = json["rating"];
    city          = json["city"];
    address       = json["address"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["description"]   = description;
    data["name"]          = name;
    data["rating"]        = rating;
    data["city"]          = city;
    data["address"]       = address;
    return data;
  }
}

class ServicesModel {
  String? description;
  String? name;

  ServicesModel({
    this.name,
    this.description,
  });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    description   = json["description"];
    name          = json["name"];
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic> {};
    data["description"]   = description;
    data["name"]          = name;
    return data;
  }
}