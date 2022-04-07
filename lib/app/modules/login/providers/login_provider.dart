
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';

import '../../../service/service_url.dart';

class LoginProvider extends GetxService {

  //用户登录请求
  static Future<MemberModel?> requestLoginUser(String username, String password) async {
    var formData = FormData.fromMap({
      "username": username,
      "password": password
    });
    var response = await Dio().post(servicePath['login'].toString(), data: formData);
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //成功登录
        return MemberModel.fromJson(response.data["data"]["member"]);
      }else{
        throw Exception("用户登录失败");
      }
    }else{
      throw Exception("用户登录请求失败");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}