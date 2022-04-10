import 'dart:convert';

List<ChartMessageModel> chartMessageModelFromJson(String str){
  return List<ChartMessageModel>.from(json.decode(str).map((e) => ChartMessageModel.fromJson(e)));
}

String chartMessageModelToJson(List<ChartMessageModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}


/**
 * 消息列表模型
 */
class ChartMessageModel {
  int? owner;
  String? time;
  String? message;

  ChartMessageModel({this.owner, this.time, this.message});

  ChartMessageModel.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    time = json['time'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['owner'] = owner;
    data['time'] = time;
    data['message'] = message;
    return data;
  }
}
