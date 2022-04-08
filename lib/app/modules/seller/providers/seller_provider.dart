import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../service/service_url.dart';
import '../../product_detail/models/sale_memeber_model.dart';
import '../../sale/models/sale_product_model.dart';

class SellerProvider extends GetConnect {
  //根据用户mid查询挂售的商品数据
  static Future<List<SaleProductModel>> requestSaleProductByMid(
      String mid) async {
    var response = await Dio().get(servicePath['getSaleProducts'].toString(),
        queryParameters: {"mid": mid});
    if (response.statusCode == 200) {
      //获取数据成功
      return saleProductModelFromJson(
          json.encode(response.data["data"]["lists"]));
    } else {
      throw Exception("获取卖家商品数据失败");
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