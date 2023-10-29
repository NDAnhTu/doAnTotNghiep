class TipsModel {
  String? id;
  String? introduce;
  String? thumb;
  String? title;
  String? url;
  String? source;

  TipsModel({
    this.id,
    this.introduce,
    this.thumb,
    this.title,
    this.url,
    this.source
  });

  TipsModel.fromJson(Map<String, dynamic> json) {
    id             = json["id"];
    introduce      = json["introduce"];
    thumb          = json["thumb"];
    title          = json["title"];
    url            = json["url"];
    source         = json["source"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"]             = id;
    data["introduce"]      = introduce;
    data["thumb"]          = thumb;
    data["title"]          = title;
    data["url"]            = url;
    data["source"]         = source;
    return data;
  }
}