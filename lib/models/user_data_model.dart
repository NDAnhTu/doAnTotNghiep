class UserData {
  String? age;
  String? heavy;
  String? image;
  String? name;
  String? owner;
  String? phone_number;
  String? sex;
  String? status;

  UserData({
    this.age,
    this.heavy,
    this.image,
    this.name,
    this.owner,
    this.phone_number,
    this.sex,
    this.status
  });

  UserData.fromJson(Map<String, dynamic> json) {
    age           = json["age"];
    heavy         = json["heavy"];
    image         = json["image"];
    name          = json["name"];
    owner         = json["owner"];
    phone_number  = json["phone_number"];
    sex           = json["sex"];
    status        = json["status"];
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["age"]           = age;
    data["heavy"]         = heavy;
    data["image"]         = image;
    data["name"]          = name;
    data["owner"]         = owner;
    data["phone_number"]  = phone_number;
    data["sex"]           = sex;
    data["status"]        = status;
    return data;
  }
}