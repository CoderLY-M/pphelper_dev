
import 'dart:convert';

List<RecommendModel> recommendModelFromJson(String str){
  return List<RecommendModel>.from(json.decode(str).map((e) => RecommendModel.fromJson(e)));
}

String recommendModelToJson(List<RecommendModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

//推荐商品模型
class RecommendModel {
  String? imageUrl;
  String? id;
  int? viewCount;
  String? productName;
  double? productPrice;

  RecommendModel(
      {this.imageUrl,
      this.id,
      this.viewCount,
      this.productName,
      this.productPrice});

  RecommendModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
    viewCount = json['viewCount'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['viewCount'] = viewCount;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
