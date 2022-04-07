import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/sale/providers/sale_provider.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../../product_detail/providers/product_detail_provider.dart';

class SaleController extends GetxController {
  //挂售商品列表
  var saleProducts = [];

  //获取挂售商品
  loadSaleProducts() async {
    try{
      //获取当前登录的用户
      var loginMember =await Get.find<MemberService>().getLoginMember();
      var memberId = loginMember?.id;
      //获取挂售数据
      var listData = await SaleProvider.requestSaleProductByMid(memberId!);
      if(listData.length != 0) {
        saleProducts = listData;
        update();
      }else{
        Fluttertoast.showToast(
            msg: "还没有上架过商品哦",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取挂售商品失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  //下架商品
  soldOutProduct(String pid) async{
    try{
      //获取当前登录的用户
      var loginMember =await Get.find<MemberService>().getLoginMember();
      var mid = loginMember?.id;
      await SaleProvider.requestSoldOut(mid!, pid);
      Fluttertoast.showToast(
          msg: "下架商品成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(e) {
      Fluttertoast.showToast(
          msg: "下架商品失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }finally{
      loadSaleProducts();
    }
  }

  //下架商品
  soldUpProduct(String pid) async{
    try{
      //获取当前登录的用户
      var loginMember =await Get.find<MemberService>().getLoginMember();
      var mid = loginMember?.id;
      await SaleProvider.requestSoldUp(mid!, pid);
      Fluttertoast.showToast(
          msg: "上架商品成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(e) {
      Fluttertoast.showToast(
          msg: "上架商品失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }finally{
      loadSaleProducts();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadSaleProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
