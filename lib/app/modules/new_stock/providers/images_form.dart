import 'package:dio/dio.dart';

class ImagesForm {
  static Future<FormData> getFormData(imageFiles) async {
    List files = [];
    for(var i = 0; i < imageFiles.length; i++) {
      files.add(await MultipartFile.fromFile(imageFiles[i].path, filename: imageFiles[i].path.split('/').last));
    }
    //获取上传
    return FormData.fromMap({
      'files': files
    });
  }
}