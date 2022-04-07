/**
 * 购物车商品
 */

class BusProductModel {
  String? imageUrl;
  String? id;
  int? count;
  String? productName;
  double? productPrice;
  bool? isCheck = false;

  BusProductModel(
      {this.imageUrl,
      this.id,
      this.count,
      this.productName,
      this.isCheck,
      this.productPrice});

  BusProductModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
    count = json['count'];
    productName = json['productName'];
    isCheck = json['isCheck'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['count'] = count;
    data['productName'] = productName;
    data['isCheck'] = isCheck;
    data['productPrice'] = productPrice;
    return data;
  }
}
