

import 'dart:convert';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 用户数据
 */
class MemberService extends GetxService {

  //获取用户数据
  Future<MemberModel?> getLoginMember() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var memberStr = sharedPreferences.getString("memberData");
    if(memberStr != null && memberStr != "") {
      var jsonStr = json.decode(memberStr);
      MemberModel memberModel = MemberModel.fromJson(jsonStr);
      return memberModel;
    }else{
      return null;
    }
  }

  //用户登录成功后添加用户
  Future<void> loginSuccess(MemberModel loginMember) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var encodeStr = json.encode(loginMember);
    await sharedPreferences.setString("memberData", encodeStr);
  }

  //用户退出登录
  Future<bool> logoutMember() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    //清除所有数据
    var isSuccess = await sharedPreferences.clear();
    return isSuccess;
  }
}