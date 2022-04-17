import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../../wallet/controllers/wallet_controller.dart';
import '../models/settle_product.dart';
import '../providers/settlement_provider.dart';

class SettlementController extends GetxController {
  //在加载
  var isLoading = true;

  //勾选的商品列表
  List<SettleProductModel> selectProducts = [];

  //总价
  var totalPrice = 0.0;

  //下单人信息
  var memberInfo;

  //初始化
  initSettlement() async {
    try{
      //获取数据信息
      var productList = Get.arguments["products"];
      //获取商品id
      for(var i = 0; i < productList.length; i++) {
        var product = await SettlementProvider.requestGetProductById(productList[i].id);
        SettleProductModel settleProductModel = new SettleProductModel();
        settleProductModel.productPrice = product.productPrice;
        settleProductModel.id = product.id;
        settleProductModel.imageUrl = product.imageUrl![0];
        settleProductModel.productCount = product.productCount;
        settleProductModel.productName = product.productName;
        settleProductModel.productDesc = product.productDesc;
        productList.forEach((element){
          if(element.id == product.id) {
            settleProductModel.orderCount = element.count;
          }
        });
        selectProducts.add(settleProductModel);
      }
      memberInfo = await Get.find<MemberService>().getLoginMember();
      //计算总价
      selectProducts.forEach((element) {
        totalPrice = totalPrice + element.productPrice! * (element.orderCount!);
      });
    }catch(e) {
      Fluttertoast.showToast(
          msg: "结算页面异常.....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }finally{
      isLoading = false;
      update();
    }
  }

  //刷新价格

  //处理购买请求
  handleBuyProduct() async {
    //获取当前余额
    var walletMoney = Get.find<WalletController>().walletMoney;
    if(walletMoney > totalPrice) {
      //余额充足
      Fluttertoast.showToast(
          msg: "请稍后，正在生成订单中.....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // //生成订单
      // await Get.find<WalletController>().createOrders(selectProducts);
      // //更新余额
      // await Get.find<WalletController>().updateWalletMoney();
    }else{
      Fluttertoast.showToast(
          msg: "可用余额不足",
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
  void onInit() {
    super.onInit();
    initSettlement();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
