

//商品订单页面模型
class SettleProductModel {
  String? productDesc;
  String? imageUrl;
  String? id;
  int? productCount;
  String? productName;
  double? productPrice;
  int? orderCount;

  SettleProductModel(
      {this.productDesc,
        this.imageUrl,
        this.id,
        this.productCount,
        this.productName,
        this.orderCount,
        this.productPrice});

  SettleProductModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    imageUrl = json['imageUrl'];
    id = json['id'];
    orderCount = json['orderCount'];
    productCount = json['productCount'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productDesc'] = productDesc;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['orderCount'] = orderCount;
    data['productCount'] = productCount;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}