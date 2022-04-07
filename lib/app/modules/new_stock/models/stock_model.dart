
/**
 * 上架商品模型
 */
class StockModel {
  String? memberId;
  String? sortId;
  String? productName;
  double? productPrice;
  String? productDesc;
  String? productDetail;
  int? status;
  int? productCount;
  List<String>? imageNames;
  List<String>? imageUrl;

  StockModel(
      {this.memberId,
      this.sortId,
      this.productName,
      this.productPrice,
      this.productDesc,
      this.productDetail,
      this.status,
      this.productCount,
      this.imageNames,
      this.imageUrl});

  StockModel.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    sortId = json['sortId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productDesc = json['productDesc'];
    productDetail = json['productDetail'];
    status = json['status'];
    productCount = json['productCount'];
    imageNames = json['imageNames'].cast<String>();
    imageUrl = json['imageUrl'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['sortId'] = sortId;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productDesc'] = productDesc;
    data['productDetail'] = productDetail;
    data['status'] = status;
    data['productCount'] = productCount;
    data['imageUrl'] = imageUrl;
    data['imageNames'] = imageNames;
    return data;
  }
}
