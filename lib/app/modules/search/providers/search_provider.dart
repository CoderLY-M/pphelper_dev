import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../service/service_url.dart';
import '../models/search_product_model.dart';

class SearchProvider extends GetConnect {
  //获取推荐商品
  static Future<List<String>> requestRecommendProducts() async {
    var response = await Dio().get(servicePath['searchProductRecommend'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data["data"]["lists"].cast<String>();
    }else{
      throw Exception("获取推荐商品数据失败");
    }
  }

  //通过关键字获取商品数据
  static Future<List<SearchProductModel>> requestProductsByQueryData(String queryData) async {
    var response = await Dio().get(servicePath['searchProducts'].toString(), queryParameters: {"query": queryData});
    if(response.statusCode == 200) {
      //获取数据成功
      return searchProductModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取搜索商品数据失败");
    }
  }
}
