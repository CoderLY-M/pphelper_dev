import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';
import 'package:pphelper/app/modules/product_detail/models/sale_memeber_model.dart';

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

  //根据用户id查询用户数据
  static Future<SaleMemberModel> requestSaleMemberById(String mid) async {
    var response = await Dio().get(servicePath['getMemberInfo'].toString(), queryParameters: {"mid": mid});
    if(response.statusCode == 200) {
      //获取数据成功
      return SaleMemberModel.fromJson(response.data["data"]["member"]);
    }else{
      throw Exception("获取卖家请求数据失败");
    }
  }
}
