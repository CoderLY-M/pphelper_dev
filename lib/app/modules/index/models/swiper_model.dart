
import 'dart:convert';

List<SwiperModel> swiperModelFromJson(String str){
  return List<SwiperModel>.from(json.decode(str).map((e) => SwiperModel.fromJson(e)));
}

String swiperModelToJson(List<SwiperModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

//轮播图模型
class SwiperModel {
  String? imageName;
  String? imageUrl;
  String? id;
  int? viewCount;

  SwiperModel({this.imageName, this.imageUrl, this.id, this.viewCount});

  SwiperModel.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
    imageUrl = json['imageUrl'];
    id = json['id'];
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageName'] = imageName;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['viewCount'] = viewCount;
    return data;
  }
}
