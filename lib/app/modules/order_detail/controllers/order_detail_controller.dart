import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/order_detail/providers/order_detail_provider.dart';
import 'package:pphelper/app/service/member_service.dart';

class OrderDetailController extends GetxController {

  //在加载
  var isLoading = true;

  //当前用户
  var currentMember;

  //当前订单
  var orderDetail;

  //获取订单数据
  handleOrderDetail() async{
    try{
      //获取订单id
      var loginMember = await Get.find<MemberService>().getLoginMember();
      currentMember = loginMember;
      var orderId = Get.arguments["orderId"];
      if(orderId != null) {
        var orderDetailModel = await OrderDetailProvider.requestOrderDetail(orderId);
        orderDetail = orderDetailModel;
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取订单详细数据失败~~~~",
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
    handleOrderDetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
