import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/controllers/bus_controller.dart';
import 'package:pphelper/app/modules/wallet/models/buy_product.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../../bus/models/bus_product_model.dart';
import '../providers/wallet_provider.dart';

class WalletController extends GetxController {
  //钱包余额
  var walletMoney = 0.0;

  //更新钱包余额
  updateWalletMoney() async {
    try{
      var memberModel = await Get.find<MemberService>().getLoginMember();
      var countMoney = await WalletProvider.requestMemberWallet(memberModel?.id);
      walletMoney = countMoney;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "更新余额失败~~~~",
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

  //处理充值金额
  handleRechargeMoney(var money) async {
    try{
      var memberModel = await Get.find<MemberService>().getLoginMember();
      await WalletProvider.requestRechargeWallet(memberModel?.id, money);
      //更新余额
      await updateWalletMoney();
      Fluttertoast.showToast(
          msg: "充值成功~~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.blue,
          fontSize: 16.0
      );
    }catch(e) {
      Fluttertoast.showToast(
          msg: "充值失败~~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0
      );
      throw e;
    }
  }

  //生成订单
  createOrders(List<BusProductModel> products) async {
    try{
      var memberModel = await Get.find<MemberService>().getLoginMember();
      var memberId = memberModel?.id;
      //构建购买商品列表数据
      List<BuyProductModel> buyProducts = [];
      products.forEach((element) {
        var buyProductModel = new BuyProductModel();
        buyProductModel.memberId = memberId;
        buyProductModel.productName = element.productName;
        buyProductModel.productId = element.id;
        buyProductModel.productCount = element.count;
        buyProducts.add(buyProductModel);
      });
      await WalletProvider.requestBuyProducts(buyProducts, memberId!);
      Fluttertoast.showToast(
          msg: "购买商品成功~~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.blue,
          fontSize: 16.0
      );
    }catch(e){
      Fluttertoast.showToast(
          msg: "购买商品失败~~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    updateWalletMoney();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
