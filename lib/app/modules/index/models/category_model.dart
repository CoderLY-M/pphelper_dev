
import 'dart:convert';

/**
 * 商品分类模型
 */
List<CategoryModel> categoryModelFromJson(String str){
  return List<CategoryModel>.from(json.decode(str).map((e) => CategoryModel.fromJson(e)));
}

String categoryModelToJson(List<CategoryModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}
class CategoryModel {
  String? icon;
  String? id;
  String? title;
  String? parentId;
  List<SubCategories>? subCategories;

  CategoryModel({this.icon, this.id, this.title, this.parentId, this.subCategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    id = json['id'];
    title = json['title'];
    parentId = json['parentId'];
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories?.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['id'] = id;
    data['title'] = title;
    data['parentId'] = parentId;
    if (subCategories != null) {
      data['subCategories'] = subCategories?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  String? icon;
  String? id;
  String? title;
  String? parentId;

  SubCategories({this.icon, this.id, this.title, this.parentId});

  SubCategories.fromJson(Map<String, dynamic> json) {
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
