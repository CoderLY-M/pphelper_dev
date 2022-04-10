import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../service/member_service.dart';
import '../../../service/storage_service.dart';
import '../models/chart_member_list_model.dart';
import '../providers/message_provider.dart';

class MessageController extends GetxController {
  //加载
  var isLoading = true;
  //定时器
  var timerFetch;

  //用户好友列表
  List<ChartMemberModel> chartMemberList = [];

  //获取用户好友列表
  updateChartMemberList() async {
    try{
      isLoading = true;
      //获取当前的用户名称
      var loginMember = await Get.find<MemberService>().getLoginMember();
      if(loginMember != null) {
        var chartList = await MessageProvider.requestGetMemberList(loginMember.id);
        chartMemberList = chartList;
      }else{
        Fluttertoast.showToast(
            msg: "你还没有登录哦~~~",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取消息列表失败~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }finally{
      isLoading = false;
      update();
    }
  }

  //定时向后台拉取消息
  fetchMessageData() {
    var timer = Timer.periodic(Duration(seconds: 5), (timer) {
      updateChartMemberList();
    });
    timerFetch = timer;
  }

  @override
  void onInit() {
    super.onInit();
    fetchMessageData();
    updateChartMemberList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timerFetch.cancel();
  }
}
