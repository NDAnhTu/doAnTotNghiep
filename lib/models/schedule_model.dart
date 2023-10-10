class ScheduleModel {
  String? customer_id;
  String? time;

  ScheduleModel({
    this.customer_id,
    this.time,
  });

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    customer_id   = json["customer_id"];
    time          = json["time"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["customer_id"]   = customer_id;
    data["time"]          = time;
    return data;
  }
}