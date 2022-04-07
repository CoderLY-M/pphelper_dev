

import 'dart:convert';

import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';

/**
 * 商品详细信息模型
 */

List<ProductDetailModel> productDetailModelFromJson(String str){
  return List<ProductDetailModel>.from(json.decode(str).map((e) => ProductDetailModel.fromJson(e)));
}

String productDetailModelToJson(List<ProductDetailModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

//商品详细数据转购物车模型
BusProductModel productDetailToBusProduct(ProductDetailModel productDetailModel) {
  return BusProductModel(
    id: productDetailModel.id,
    productName: productDetailModel.productName,
    imageUrl: productDetailModel.imageUrl![0],
    count: 1,
    isCheck: false,
    productPrice: productDetailModel.productPrice
  );
}

//商品详细数据
class ProductDetailModel {
  String? productDesc;
  String? productDetail;
  String? sortId;
  List<String>? imageUrl;
  String? id;
  int? viewCount;
  int? productCount;
  String? productName;
  double? productPrice;

  ProductDetailModel(
      {this.productDesc,
      this.productDetail,
      this.sortId,
      this.imageUrl,
      this.id,
      this.viewCount,
      this.productCount,
      this.productName,
      this.productPrice});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    productDetail = json['productDetail'];
    sortId = json['sortId'];
    imageUrl = json['imageUrl'].cast<String>();
    id = json['id'];
    viewCount = json['viewCount'];
    productCount = json['productCount'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productDesc'] = productDesc;
    data['productDetail'] = productDetail;
    data['sortId'] = sortId;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['viewCount'] = viewCount;
    data['productCount'] = productCount;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
