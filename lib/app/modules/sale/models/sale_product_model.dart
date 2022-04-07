

import 'dart:convert';

import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';

/**
 * 商品详细信息模型
 */

List<SaleProductModel> saleProductModelFromJson(String str){
  return List<SaleProductModel>.from(json.decode(str).map((e) => SaleProductModel.fromJson(e)));
}

String saleProductModelToJson(List<SaleProductModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

//挂售商品数据
class SaleProductModel {
  String? productDesc;
  String? productDetail;
  String? sortId;
  String? imageUrl;
  String? id;
  int? viewCount;
  int? productCount;
  String? productName;
  double? productPrice;
  int? status;

  SaleProductModel(
      {this.productDesc,
        this.productDetail,
        this.sortId,
        this.imageUrl,
        this.id,
        this.viewCount,
        this.productCount,
        this.productName,
        this.status,
        this.productPrice});

  SaleProductModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    productDetail = json['productDetail'];
    sortId = json['sortId'];
    imageUrl = json['imageUrl'];
    id = json['id'];
    status = json['status'];
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
