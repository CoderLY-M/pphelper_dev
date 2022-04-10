import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../service/service_url.dart';
import '../../login/models/member_model.dart';
import '../models/chart_member_list_model.dart';


class MessageProvider extends GetxService {
  //获取当前用户的好友列表（消息列表）
  static Future<List<ChartMemberModel>> requestGetMemberList(String? memberId) async {
    var response = await Dio().get(servicePath['memberList'].toString(), queryParameters: {"memberId":memberId});
    if(response.statusCode == 200) {
      //获取数据成功
      return chartMemberModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取商品数据失败");
    }
  }
}