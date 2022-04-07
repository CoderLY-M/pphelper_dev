
import 'dart:convert';

List<MemberModel> memberModelFromJson(String str){
  return List<MemberModel>.from(json.decode(str).map((e) => MemberModel.fromJson(e)));
}

String memberModelToJson(List<MemberModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

/**
 * 用户模型
 */
class MemberModel {
  String? id;
  String? username;
  String? password;
  String? nickName;
  int? sex;
  int? age;
  String? avatar;
  String? phone;
  String? email;
  String? token;

  MemberModel(
      {this.id,
      this.username,
      this.password,
      this.nickName,
      this.sex,
      this.age,
      this.avatar,
      this.phone,
      this.email,
      this.token});

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    nickName = json['nickName'];
    sex = json['sex'];
    age = json['age'];
    avatar = json['avatar'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['nickName'] = nickName;
    data['sex'] = sex;
    data['age'] = age;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
