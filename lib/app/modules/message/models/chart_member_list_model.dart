

import 'dart:convert';

List<ChartMemberModel> chartMemberModelFromJson(String str){
  return List<ChartMemberModel>.from(json.decode(str).map((e) => ChartMemberModel.fromJson(e)));
}

String chartMemberModelToJson(List<ChartMemberModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

/**
 * 聊天用户基本信息
 */
class ChartMemberModel {
  String? anotherId;
  String? nickName;
  String? avatar;
  String? message;
  String? time;

  ChartMemberModel({this.anotherId, this.nickName, this.avatar, this.message, this.time});

  ChartMemberModel.fromJson(Map<String, dynamic> json) {
    anotherId = json['anotherId'];
    nickName = json['nickName'];
    avatar = json['avatar'];
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['anotherId'] = anotherId;
    data['nickName'] = nickName;
    data['avatar'] = avatar;
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
