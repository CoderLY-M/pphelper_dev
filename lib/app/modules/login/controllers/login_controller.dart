import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';
import 'package:pphelper/app/modules/login/providers/login_provider.dart';
import 'package:pphelper/app/modules/member/controllers/member_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import 'package:pphelper/app/service/member_service.dart';

class LoginController extends GetxController {

  //是否在加载
  var isLoading = false;
  //是否登录成功
  var success = false;

  //用户登录
  memberLogin(String inputUseNameStr,String inputPassWordStr) async{
    isLoading = true;
    try{
      isLoading = true;
      var result = await LoginProvider.requestLoginUser(inputUseNameStr,inputPassWordStr);
      await Get.find<MemberService>().loginSuccess(result!);
      //获取用户
      var loginMember = await Get.find<MemberService>().getLoginMember();
      success = true;
      Fluttertoast.showToast(
          msg: "登录成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.offNamed(Routes.HOME);
      Get.find<MemberController>().initLoginMember();
    }catch(e){
      //登录失败
      success = false;
      Fluttertoast.showToast(
          msg: "用户名或者密码错误",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } finally{
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
