
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pphelper/app/modules/chart/models/chart_message_model.dart';

import '../../../service/service_url.dart';

class ChartProvider extends GetxService {

  //建立聊天连接
  static Future<void> requestChartConnectCreate(String memberId, String anotherId) async {
    var response = await Dio().get(servicePath['chartConnectCreate'].toString(), queryParameters: {"memberId":memberId, "anotherId": anotherId});
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] != 200) {
        throw Exception("建立聊天失败");
      }
    }else{
      throw Exception("建立聊天请求失败");
    }
  }

  //发送消息
  static Future<void> requestSendMessage(String memberId, String anotherId, String message) async {
    var response = await Dio().post(servicePath['sendMessage'].toString(), data: {"memberId":memberId, "anotherId": anotherId, "message": message});
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 201) {
        throw Exception("发送消息失败");
      }
    }else{
      throw Exception("发送消息请求失败");
    }
  }

  //获取消息列表数据
  static Future<List<ChartMessageModel>> requestChartMessageList(String memberId, String anotherId) async {
    var response = await Dio().get(servicePath['messageList'].toString(), queryParameters: {"memberId":memberId, "anotherId": anotherId });
    if(response.statusCode == 200) {
      return chartMessageModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取消息列表请求失败");
    }
  }
}