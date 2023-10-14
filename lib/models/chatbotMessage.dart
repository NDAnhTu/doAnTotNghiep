class ChatBotMessageModel {
  String? message;
  bool? isUserMessage;

  ChatBotMessageModel({
    this.message,
    this.isUserMessage,
  });

  ChatBotMessageModel.fromJson(Map<String, dynamic> json) {
    message         = json["message"];
    isUserMessage   = json["isUserMessage"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["message"]       = message;
    data["isUserMessage"] = isUserMessage;
    return data;
  }
}