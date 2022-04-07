
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';

import '../../../service/service_url.dart';

class RegisterProvider extends GetxService {

  //用户注册请求
  static Future<int> requestRegisterMember(MemberModel memberModel) async {
    var jsonStr = json.encode(memberModel);
    var response = await Dio().post(servicePath['register'].toString(), data: jsonStr);
    if(response.statusCode == 200) {
      return response.data["code"];
    }else{
      throw Exception("用户注册请求失败");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}