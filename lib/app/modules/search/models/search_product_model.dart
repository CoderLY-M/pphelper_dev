


import 'dart:convert';

List<SearchProductModel> searchProductModelFromJson(String str){
  return List<SearchProductModel>.from(json.decode(str).map((e) => SearchProductModel.fromJson(e)));
}

String searchProductModelToJson(List<SearchProductModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

/**
 * 搜索商品数据模型
 */
class SearchProductModel {
  String? imageUrl;
  String? id;
  int? viewCount;
  String? productName;
  String? productDesc;
  int? buyCount;
  double? productPrice;

  SearchProductModel(
      {this.imageUrl,
      this.id,
      this.viewCount,
      this.productName,
      this.productDesc,
      this.buyCount,
      this.productPrice});

  SearchProductModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
    viewCount = json['viewCount'];
    productName = json['productName'];
    productDesc = json['productDesc'];
    buyCount = json['buyCount'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['viewCount'] = viewCount;
    data['productName'] = productName;
    data['productDesc'] = productDesc;
    data['buyCount'] = buyCount;
    data['productPrice'] = productPrice;
    return data;
  }
}
