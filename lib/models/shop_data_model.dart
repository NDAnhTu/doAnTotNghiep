class ShopDataModel {
  String? description;
  String? name;
  String? rating;

  ShopDataModel({
    this.name,
    this.rating,
  });

  ShopDataModel.fromJson(Map<String, dynamic> json) {
    description   = json["description"];
    name          = json["name"];
    rating        = json["rating"];
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["description"]   = description;
    data["name"]          = name;
    data["rating"]        = rating;
    return data;
  }
}