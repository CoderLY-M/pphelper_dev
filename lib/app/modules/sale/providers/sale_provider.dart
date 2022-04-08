import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../service/service_url.dart';
import '../models/sale_product_model.dart';

class SaleProvider extends GetConnect {
  //根据用户mid查询挂售的商品数据
  static Future<List<SaleProductModel>> requestSaleProductByMid(String mid) async {
    var response = await Dio().get(servicePath['getSaleProducts'].toString(), queryParameters: {"mid": mid});
    if(response.statusCode == 200) {
      //获取数据成功
      return saleProductModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取商品数据失败");
    }
  }

  //根据用户mid查询挂售上架商品数量
  static Future<int> requestSaleCountsByMid(String mid) async {
    var response = await Dio().get(servicePath['getSaleCounts'].toString(), queryParameters: {"mid": mid});
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data["data"]["counts"];
    }else{
      throw Exception("获取商品数据失败");
    }
  }

  //根据用户mid与商品id下架商品
  static Future<bool> requestSoldOut(String mid, String pid) async {
    var response = await Dio().get(servicePath['soldOut'].toString(), queryParameters: {"mid": mid, "pid": pid});
    if(response.statusCode == 200) {
      if(response.data["code"] == 200) {
        //下架成功
        return true;
      }else{
        throw Exception("下架商品失败");
      }

    }else{
      throw Exception("下架商品请求失败");
    }
  }

  //根据用户mid与商品id上架商品
  static Future<bool> requestSoldUp(String mid, String pid) async {
    var response = await Dio().get(servicePath['soldUp'].toString(), queryParameters: {"mid": mid, "pid": pid});
    if(response.statusCode == 200) {
      if(response.data["code"] == 200) {
        //上架成功
        return true;
      }else{
        throw Exception("上架商品失败");
      }
    }else{
      throw Exception("上架商品请求失败");
    }
  }
}
