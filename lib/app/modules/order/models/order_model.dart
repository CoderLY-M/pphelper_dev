import 'dart:convert';

List<OrderModel> orderModelFromJson(String str){
  return List<OrderModel>.from(json.decode(str).map((e) => OrderModel.fromJson(e)));
}

String orderModelToJson(List<OrderModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

/**
 * 订单模型
 */
class OrderModel {
  String? id;
  String? productId;
  String? productTitle;
  String? productCover;
  String? sellerId;
  int? productCount;
  String? sellerName;
  double? totalFee;
  int? status;

  OrderModel(
      {this.id,
      this.productId,
      this.productTitle,
      this.productCover,
      this.sellerId,
      this.productCount,
      this.sellerName,
      this.totalFee,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    productTitle = json['productTitle'];
    productCover = json['productCover'];
    sellerId = json['sellerId'];
    productCount = json['productCount'];
    sellerName = json['sellerName'];
    totalFee = json['totalFee'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['productTitle'] = productTitle;
    data['productCover'] = productCover;
    data['sellerId'] = sellerId;
    data['productCount'] = productCount;
    data['sellerName'] = sellerName;
    data['totalFee'] = totalFee;
    data['status'] = status;
    return data;
  }
}
