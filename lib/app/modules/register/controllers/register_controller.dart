import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/register/providers/register_provider.dart';
import 'package:pphelper/app/routes/app_pages.dart';

import '../../login/models/member_model.dart';

class RegisterController extends GetxController {
  //是否正在注册
  var isRegistering = false;
  //是否注册成功
  var registerSuccess = false;
  updateLoginMember(MemberModel memberModel) async{
    //用户注册
    try{
      isRegistering = true;
      var code = await RegisterProvider.requestRegisterMember(memberModel);
      if(code == 200) {
        registerSuccess = true;
        Fluttertoast.showToast(
            msg: "用户注册成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
        //跳转到登录页面
        Get.offNamed(Routes.LOGIN);
      }else if(code == 201) {
        registerSuccess = false;
        Fluttertoast.showToast(
            msg: "用户注册失败，请检查用户名或者手机号",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else if(code == 202) {
        registerSuccess = false;
        Fluttertoast.showToast(
            msg: "用户注册失败，用户名重复",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else if(code == 203){
        registerSuccess = false;
        Fluttertoast.showToast(
            msg: "用户注册失败，手机号码重复",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
      //注册失败
      registerSuccess = false;
      Fluttertoast.showToast(
          msg: "注册请求失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } finally{
      isRegistering = false;
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
