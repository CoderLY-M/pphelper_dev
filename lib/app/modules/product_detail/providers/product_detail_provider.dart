import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../service/service_url.dart';
import '../models/product_detail_model.dart';

class ProductDetailProvider extends GetConnect {
  //根据商品id查询商品数据
  static Future<ProductDetailModel> requestGetProductById(String pid) async {
    var response = await Dio().get(servicePath['getProductById'].toString(), queryParameters: {"pid": pid});
    if(response.statusCode == 200) {
      //获取数据成功
      return ProductDetailModel.fromJson(response.data["data"]["product"]);
    }else{
      throw Exception("获取商品数据失败");
    }
  }
}
