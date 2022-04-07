

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../service/service_url.dart';
import '../models/stock_model.dart';
import 'images_form.dart';

class StockProvider extends GetConnect {
  //商品上架请求
  static Future<bool> requestNewStock(StockModel stockModel) async {
    //上传文件
    var response = await Dio().post(servicePath['newStock'].toString(), data: json.encode(stockModel));
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //成功登录
        return true;
      }else{
        throw Exception("上架商品失败");
      }
    }else{
      throw Exception("上架商品请求失败");
    }
  }

  //上传图片请求
  static Future<List<dynamic>> uploadImageFiles(List<XFile> imageFiles) async {
    var formData = await ImagesForm.getFormData(imageFiles);
    var response = await Dio().post(servicePath['uploadImages'].toString(), data: formData);
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //获取上传的文件名称
        return response.data["data"]["imageUrls"];
      }else{
        throw Exception("图片上传失败");
      }
    }else{
      throw Exception("图片上传请求失败");
    }
  }
}
