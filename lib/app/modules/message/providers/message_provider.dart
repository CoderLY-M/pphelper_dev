import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../../service/service_url.dart';
import '../../login/models/member_model.dart';


class MessageProvider extends GetxService {
  //用户修改请求
  static Future<MemberModel?> updateLoginUser(MemberModel memberModel) async {
    var dio = Dio();
    var jsonStr = json.encode(memberModel);
    var response = await dio.post(servicePath['updateMember'].toString(), data: jsonStr);
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //成功登录
        return MemberModel.fromJson(response.data["data"]["member"]);
      }else{
        throw Exception("更新用户失败");
      }
    }else{
      throw Exception("更新用户请求失败");
    }
  }
}