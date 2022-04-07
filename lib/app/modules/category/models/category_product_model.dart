
import 'dart:convert';

/**
 * 商品分类列表模型
 */
List<CategoryProductModel> categoryProductModelFromJson(String str){
  return List<CategoryProductModel>.from(json.decode(str).map((e) => CategoryProductModel.fromJson(e)));
}

String categoryProductModelToJson(List<CategoryProductModel> data){
  return json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
}

class CategoryProductModel {
  String? productDesc;
  String? productDetail;
  String? sortId;
  List<String>? imageUrl;
  String? id;
  int? viewCount;
  String? productName;
  double? productPrice;

  CategoryProductModel(
      {this.productDesc,
      this.productDetail,
      this.sortId,
      this.imageUrl,
      this.id,
      this.viewCount,
      this.productName,
      this.productPrice});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    productDetail = json['productDetail'];
    sortId = json['sortId'];
    imageUrl = json['imageUrl'].cast<String>();
    id = json['id'];
    viewCount = json['viewCount'];
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
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
