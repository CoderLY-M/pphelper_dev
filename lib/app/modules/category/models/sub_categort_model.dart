
import 'dart:convert';

/**
 * 小类模型
 */

List<SubCategoryModel> subCategoryModelFromJson(String str){
  return List<SubCategoryModel>.from(json.decode(str).map((e) => SubCategoryModel.fromJson(e)));
}

String subCategoryModelToJson(List<SubCategoryModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

class SubCategoryModel {
  String? icon;
  String? id;
  String? title;
  String? parentId;

  SubCategoryModel({this.icon, this.id, this.title, this.parentId});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    id = json['id'];
    title = json['title'];
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['id'] = id;
    data['title'] = title;
    data['parentId'] = parentId;
    return data;
  }
}