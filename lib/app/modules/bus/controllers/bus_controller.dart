import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';
import 'package:pphelper/app/modules/wallet/controllers/wallet_controller.dart';

import '../../../service/storage_service.dart';

class BusController extends GetxController {
  //购物车商品
  List<BusProductModel> dataProducts = [];
  //购物车价格
  var totalPrice = 0.0;
  //是否都选中
  var allChecked = false;
  //选中商品的数量
  int checkedCount = 0;

  //从服务中心获取数据
  updateBusProducts() async{
    await Get.find<StorageService>().getBusProducts().then((busList){
      dataProducts = busList;
      updateBusProductsPrice();
      update();
    });
  }

  //获取勾选上的商品
  getCheckedShops() async {
    List<BusProductModel> checkedShop = [];
    List<BusProductModel> shops = await Get.find<StorageService>().getBusProducts();
    shops.forEach((element) {
      if(element.isCheck == true) {
        //勾选上，加入勾选上的商品
        checkedShop.add(element);
      }
    });
    return checkedShop;
  }

  //添加一件商品
  addBusProduct(busProductModel) async {
    try{
      await Get.find<StorageService>().addBusProduct(busProductModel);
      //刷新商品数据
      Fluttertoast.showToast(
          msg: "加入购物车成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      updateBusProducts();
    }catch(e){
      Fluttertoast.showToast(
          msg: "加入购物车失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  //移除一件商品
  removeBusProduct(var pid) async{
    await Get.find<StorageService>().removeBusProduct(pid);
    updateBusProducts();
  }

  //减少一件商品
  decrementBusProduct(var pid) async {
    await Get.find<StorageService>().decrementBusProduct(pid);
    //刷新
    updateBusProducts();
  }

  //刷新商品价格
  updateBusProductsPrice() {
    checkedCount = 0;
    double temTotalPrice = 0.0;
    dataProducts.forEach((busModel) {
      if(busModel.isCheck == true) {
        checkedCount++;
        temTotalPrice = temTotalPrice + busModel.productPrice! * (busModel.count!);
      }
    });
    if(checkedCount == dataProducts.length) allChecked = true;
    totalPrice = temTotalPrice;
  }

  //处理所有商品是否选中状态
  handleAllChecked(val) async {
    if(val){
      allChecked = true;
    } else {
      allChecked = false;
    }
    //更新商品状态
    await Get.find<StorageService>().updateBusProductAllCheck(val);
    updateBusProducts();
  }

  //处理一件商品是否选中状态
  handleOneChecked(pid, val) async {
    //更新商品状态
    await Get.find<StorageService>().updateBusProductOneCheck(pid, val);
    updateBusProducts();
  }

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
          backgroundColor: Colors.red,
          textColor: Colors.blue,
          fontSize: 16.0
      );
      //生成订单
      List<BusProductModel> checkProducts = await getCheckedShops();
      await Get.find<WalletController>().createOrders(checkProducts);
      //更新余额
      await Get.find<WalletController>().updateWalletMoney();
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
    updateBusProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
