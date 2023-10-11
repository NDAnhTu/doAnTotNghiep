class TipsModel {
  String? id;
  String? introduce;
  String? thumb;
  String? title;

  TipsModel({
    this.id,
    this.introduce,
    this.thumb,
    this.title,
  });

  TipsModel.fromJson(Map<String, dynamic> json) {
    id             = json["id"];
    introduce      = json["introduce"];
    thumb          = json["thumb"];
    title          = json["title"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"]             = id;
    data["introduce"]      = introduce;
    data["thumb"]          = thumb;
    data["title"]          = title;
    return data;
  }
}