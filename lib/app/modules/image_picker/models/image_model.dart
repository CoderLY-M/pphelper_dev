/**
 * 图片模型
 */
class ImageModel {
  String? imageUrl;
  String? imageName;

  ImageModel({this.imageUrl, this.imageName});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['imageName'] = imageName;
    return data;
  }
}
