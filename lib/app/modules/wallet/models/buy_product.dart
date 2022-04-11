import 'dart:convert';

List<BuyProductModel> byProductModelFromJson(String str){
  return List<BuyProductModel>.from(json.decode(str).map((e) => BuyProductModel.fromJson(e)));
}

String byProductModelToJson(List<BuyProductModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

/**
 * 用户模型
 */
class BuyProductModel {
  String? memberId;
  String? productId;
  String? productName;
  int? productCount;

  BuyProductModel(
      {this.memberId,
        this.productId,
        this.productName,
        this.productCount});

  BuyProductModel.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    productId = json['productId'];
    productName = json['productName'];
    productCount = json['productCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['productId'] = productId;
    data['productName'] = productName;
    data['productCount'] = productCount;
    return data;
  }
}