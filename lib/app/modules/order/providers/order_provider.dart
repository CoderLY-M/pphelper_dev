
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/order/models/order_model.dart';

import '../../../service/service_url.dart';

class OrderProvider extends GetxService {

  //获取订单数据
  static Future<List<OrderModel>> requestOrderList(String? memberId, int status) async {
    var response = await Dio().post(servicePath['orderList'].toString(), data: {"memberId": memberId, "status": status});
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        return orderModelFromJson(json.encode(response.data["data"]["lists"]));
      }else{
        throw Exception("获取订单列表数据失败");
      }
    }else{
      throw Exception("获取订单列表数据请求失败");
    }
  }
}