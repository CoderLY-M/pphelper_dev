import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/controllers/bus_controller.dart';
import 'package:pphelper/app/modules/collection/controllers/collection_controller.dart';

import '../models/product_detail_model.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailController extends GetxController {
  //加载
  var isLoading = false; //是否在加载
  //当前商品
  var productModel;

  //是否收藏
  var isCollection = false;
  final CollectionController collectionController = Get.put(CollectionController());

  //商品数据的改变
  changeCurrentProduct() async{
    try{
      isLoading = true;
      //获取传递的pid值
      var pid = Get.arguments["productId"];
      var product = await ProductDetailProvider.requestGetProductById(pid);
      if(product != null) {
        productModel = product;
      }
    }catch(e) {

    }finally{
      isLoading = false;
      update();
    }
  }

  //添加商品到购物车
  addProductToBus() {
    Get.find<BusController>().addBusProduct(productDetailToBusProduct(productModel));
  }

  //添加商品到我的收藏
  Future<bool> addProductToCollection() async{
    try{
      await collectionController.addCollectionProduct(productDetailToCollection(productModel));
      //添加成功
      return true;
    }catch(e) {
      return false;
    }
  }

  //初始化是否收藏
  initIsCollection() async{
    if(productModel != null) {
      var flag = await collectionController.productIsCollection(productModel.id);
      flag ? isCollection = true : isCollection = false;
      update();
    }
  }

  //从我的收藏中移除商品
  Future<bool> removeProductToCollection() async{
    try{
      await collectionController.removeBusProduct(productModel.id);
      //移除成功
      return true;
    }catch(e) {
      return false;
    }
  }

  //更新是否收藏
  updateIsCollection() {
    isCollection = !isCollection;
    if(isCollection) {
      //添加收藏
      Get.find<ProductDetailController>().addProductToCollection().then((success){
        if(success) {
          //刷新商品数据
          Fluttertoast.showToast(
            msg: "加入我的收藏成功",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }else{
          Fluttertoast.showToast(
            msg: "加入我的收藏失败",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      });
    }else{
      Get.find<ProductDetailController>().removeProductToCollection().then((success){
        if(success) {
          //刷新商品数据
          Fluttertoast.showToast(
              msg: "移除收藏成功",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else{
          Fluttertoast.showToast(
              msg: "移除收藏失败",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
      //取消收藏
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await changeCurrentProduct();
    await initIsCollection();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
