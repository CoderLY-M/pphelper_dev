

class CollectionModel {
  String? productDesc;
  String? imageUrl;
  String? id;
  String? productName;
  double? productPrice;

  CollectionModel(
      {this.productDesc,
      this.imageUrl,
      this.id,
      this.productName,
      this.productPrice});

  CollectionModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    imageUrl = json['imageUrl'];
    id = json['id'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productDesc'] = productDesc;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    return data;
  }
}
