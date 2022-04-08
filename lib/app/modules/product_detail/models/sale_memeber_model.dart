/**
 * 卖家消息
 */
class SaleMemberModel {
  String? id;
  String? username;
  String? nickName;
  int? sex;
  int? age;
  String? avatar;
  String? phone;
  String? email;
  String? token;

  SaleMemberModel(
      {this.id,
        this.username,
        this.nickName,
        this.sex,
        this.age,
        this.avatar,
        this.phone,
        this.email,
        this.token});

  SaleMemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
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