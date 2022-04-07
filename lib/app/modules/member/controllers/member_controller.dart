import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';
import 'package:pphelper/app/modules/member/providers/memer_provider.dart';
import 'package:pphelper/app/service/member_service.dart';

class MemberController extends GetxController {
  //设置是否显示
  var setIsView = false;
  //是否在更新
  var isUpdating = false;
  //更新是否成功
  var updateSuccess = false;

  //当前用户
  var loginMember;

  //获取当前登录的用户
  initLoginMember() async{
    var memberModel = await Get.find<MemberService>().getLoginMember();
    loginMember = memberModel;
    updateSetIsView();
    update();
  }

  //更新设置按键是否显示
  updateSetIsView() {
    if(loginMember != null && loginMember.id != "") {
      setIsView = true;
    }else{
      setIsView = false;
    }
  }

  //更新用户数据
  updateLoginMember(MemberModel memberModel) async{
    //更新用户数据
    try{
      isUpdating = true;
      var result = await MemberProvider.updateLoginUser(memberModel);
      await Get.find<MemberService>().loginSuccess(result!);
      updateSuccess = true;
      Get.find<MemberController>().initLoginMember();
      Fluttertoast.showToast(
          msg: "更新用户成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(e){
      //登录失败
      updateSuccess = false;
      Fluttertoast.showToast(
          msg: "更新用户失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } finally{
      isUpdating = false;
      update();
    }
  }

  //退出登录
  logOutMember() async{
    await Get.find<MemberService>().logoutMember().then((value){
      if(value) {
        //退出登录成功
        initLoginMember();
        Fluttertoast.showToast(
            msg: "退出登录成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    initLoginMember();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
