import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../service/service_url.dart';
import '../models/buy_product.dart';

class WalletProvider extends GetConnect {
  //获取钱包数据
  static Future<double> requestMemberWallet(String? memberId) async {
    var response = await Dio().post(servicePath['account'].toString(), data: {"memberId": memberId});
    if(response.statusCode == 200) {
      if(response.data["code"] == 200) {
        //获取数据成功
        return response.data["data"]["wallet"];
      }else{
        throw Exception("获取用户余额失败");
      }
    }else{
      throw Exception("获取用户余额请求失败");
    }
  }

  //余额充值
  static Future<void> requestRechargeWallet(String? memberId, double money) async {
    var response = await Dio().post(servicePath['recharge'].toString(), data: {"memberId": memberId, "money": money});
    if(response.statusCode == 200) {
      if(response.data["code"] != 200) {
        throw Exception("用户充值失败");
      }
    }else{
      throw Exception("用户充值请求失败");
    }
  }

  //商品购买
  static Future<void> requestBuyProducts(List<BuyProductModel> buyProducts, String memberId) async {
    var response = await Dio().post(servicePath['buyProducts'].toString(), data: {"lists": byProductModelToJson(buyProducts), "memberId": memberId});
    if(response.statusCode == 200) {
      if(response.data["code"] != 200) {
        throw Exception("商品购买失败");
      }
    }else{
      throw Exception("商品购买请求失败");
    }
  }
}