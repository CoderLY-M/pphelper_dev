import 'dart:convert';

/**
 * 首页商品模型
 */
List<HomeProductModel> homeProductModelFromJson(String str){
  return List<HomeProductModel>.from(json.decode(str).map((e) => HomeProductModel.fromJson(e)));
}

String homeProductModelToJson(List<HomeProductModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

class HomeProductModel {
  String? imageUrl;
  String? id;
  int? viewCount;
  String? productName;
  double? productPrice;

  HomeProductModel(
      {this.imageUrl,
      this.id,
      this.viewCount,
      this.productName,
      this.productPrice});

  HomeProductModel.fromJson(Map<String, dynamic> json) {
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
