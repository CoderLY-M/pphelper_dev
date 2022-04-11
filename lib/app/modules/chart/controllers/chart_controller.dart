import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/chart/models/chart_message_model.dart';
import 'package:pphelper/app/modules/chart/providers/chart_provider.dart';
import 'package:pphelper/app/modules/member/controllers/member_controller.dart';

class ChartController extends GetxController {
  //在加载
  var isLoading = true;
  //卖家id
  var anotherId;
  //定时器
  var timerFetch;

  //获取消息数据
  List<ChartMessageModel> messageList = [];

  //更新消息数据
  updateMessageList() async{
    isLoading = true;
    try{
      var loginMember = await Get.find<MemberController>().loginMember;
      var memberId = loginMember.id;
      anotherId = Get.arguments["another"].id;
      var list = await ChartProvider.requestChartMessageList(memberId, anotherId);
      messageList = list;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取消息数据失败~~~",
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

  //发送消息
  handleSendMessage(String message) async {
    try{
      var loginMember = await Get.find<MemberController>().loginMember;
      var memberId = loginMember.id;
      if(memberId != anotherId) {
        //自己不能给自家发消息
        await ChartProvider.requestSendMessage(memberId, anotherId, message);
        //更新
        updateMessageList();
      }else{
        Fluttertoast.showToast(
            msg: "自己不能给自己发送消息~~~",
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
          msg: "发送消息失败~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }finally{
      update();
    }
  }

  //定时向后台拉取消息
  fetchMessageData() {
    var timer = Timer.periodic(Duration(seconds: 5), (timer) {
      updateMessageList();
    });
    timerFetch = timer;
  }

  @override
  void onInit() {
    super.onInit();
    fetchMessageData();
    updateMessageList();
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
