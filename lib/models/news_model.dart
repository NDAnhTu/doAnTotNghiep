import 'dart:convert';

class NewsModel {
  String? id;
  String? image;
  String? p;
  String? title;
  List<dynamic>? para;

  NewsModel({
    this.id,
    this.image,
    this.p,
    this.title,
    this.para,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id             = json["id"];
    image          = json["image"];
    title          = json["title"];
    p              = json["p"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"]             = id;
    data["image"]          = image;
    data["title"]          = title;
    data["p"]              = p;
    return data;
  }
}