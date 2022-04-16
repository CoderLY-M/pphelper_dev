
/**
 * 订单详情
 */
class OrderDetailModel {
  int? buyCount;
  String? productId;
  double? totalPrice;
  String? sellerName;
  int? productCount;
  String? productName;
  String? productDesc;
  String? sellId;
  String? productImage;
  int? payType;
  String? phone;
  String? id;
  String? time;
  double? productPrice;

  OrderDetailModel(
      {this.buyCount,
        this.productId,
        this.totalPrice,
        this.sellerName,
        this.productCount,
        this.productName,
        this.productDesc,
        this.sellId,
        this.productImage,
        this.payType,
        this.phone,
        this.id,
        this.time,
        this.productPrice});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    buyCount = json['buyCount'];
    productId = json['productId'];
    totalPrice = json['totalPrice'];
    sellerName = json['sellerName'];
    productCount = json['productCount'];
    productName = json['productName'];
    productDesc = json['productDesc'];
    sellId = json['sellId'];
    productImage = json['productImage'];
    payType = json['payType'];
    phone = json['phone'];
    id = json['id'];
    time = json['time'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['buyCount'] = buyCount;
    data['productId'] = productId;
    data['totalPrice'] = totalPrice;
    data['sellerName'] = sellerName;
    data['productCount'] = productCount;
    data['productName'] = productName;
    data['productDesc'] = productDesc;
    data['sellId'] = sellId;
    data['productImage'] = productImage;
    data['payType'] = payType;
    data['phone'] = phone;
    data['id'] = id;
    data['time'] = time;
    data['productPrice'] = productPrice;
    return data;
  }
}
