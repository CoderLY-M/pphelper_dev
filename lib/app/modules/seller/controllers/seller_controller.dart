import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../providers/seller_provider.dart';

class SellerController extends GetxController {
  var isLoading = true;
  //卖家数据
  var sellData;
  //挂售商品列表
  var sellerProducts = [];

  initBasicData() async {
    isLoading = true;
    await initSellerData();
    await loadSaleProducts();
    isLoading = false;
    update();
  }

  //获取挂售商品
  loadSaleProducts() async {
    try{
      //获取挂售数据
      var listData = await SellerProvider.requestSaleProductByMid(sellData.id);
      if(listData.length != 0) {
        sellerProducts = listData;
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

  //更新卖家信息
  initSellerData() async{
    try{
      var memberId = Get.arguments["memberId"];
      var saleMemberModel = await SellerProvider.requestSaleMemberById(memberId);
      sellData = saleMemberModel;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取卖家数据失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  void onInit(){
    super.onInit();
    initBasicData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
