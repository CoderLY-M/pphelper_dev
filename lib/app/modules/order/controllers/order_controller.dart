import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/order/providers/order_provider.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../models/order_model.dart';

class OrderController extends GetxController {
  //在加载
  var isLoading = true;

  /**
   * 当前tabber的下标
   * 0：表示全部订单
   * 1：表示待付款订单
   * 2：表示待发货订单
   * 3：表示待收货订单
   * 4：表示待评价订单
   */
  int tabberIndex = 0;

  //当前的订单列表
  List<OrderModel> orderList = [];

  //更新下标
  updateTabberIndex(int index) {
    tabberIndex = index;
    updateOrderList();
  }

  //获取/更新订单数据
  updateOrderList() async{
    try{
      //获取当前用户
      var memberModel = await Get.find<MemberService>().getLoginMember();
      var memberId = memberModel?.id;
      //获取当前下标
      var lists = await OrderProvider.requestOrderList(memberId,tabberIndex);
      orderList = lists;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取订单列表数据失败~~~~",
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

  @override
  void onInit() {
    super.onInit();
    updateOrderList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
