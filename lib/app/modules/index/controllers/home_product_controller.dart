import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/models/home_product_model.dart';
import 'package:pphelper/app/modules/index/models/swiper_model.dart';
import 'package:pphelper/app/modules/index/providers/home_provider.dart';

class HomeProductController extends GetxController {

  var isLoading = true; //是否在加载
  var currentPageNum = 1; //当前的商品页码

  //首页商品数据
  List<HomeProductModel> productList = [];

  //初始化首页商品数据
  initProductList() async {
    try{
      isLoading = true;
      var lists = await HomeProvider.requestSellProducts(pageNum: currentPageNum);
      if(lists != null) {
        productList = lists;
      }
      currentPageNum++;
    }finally{
      isLoading = false;
    }
    update();
  }

  //上拉刷新首页商品数据
  dropDownRefreshProductList() async{
    try{
      isLoading = true;
      currentPageNum = 1;
      var lists = await HomeProvider.requestSellProducts(pageNum: currentPageNum);
      if(lists != null && lists.length != 0) {
        productList = lists;
      }else{
        Fluttertoast.showToast(
            msg: "目前没有商品数据哦~~~~",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
      }
    }finally{
      currentPageNum++;
      isLoading = false;
    }
    update();
  }

  //下滑更新首页商品数据
  refreshProductList() async{
    try{
      isLoading = true;
      var lists = await HomeProvider.requestSellProducts(pageNum: currentPageNum);
      if(lists != null && lists.length != 0) {
        productList.addAll(lists);
      }else{
        Fluttertoast.showToast(
            msg: "没有更多数据了哦~~~~",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
      }
    }finally{
      currentPageNum++;
      isLoading = false;
    }
    update();
  }

  //更新商品的浏览量
  refreshProductViewCount(String pid) async{
    try{
      await HomeProvider.requestRefreshProductViewCount(pid);
    }catch(e) {
      Fluttertoast.showToast(
          msg: "更新商品浏览量数据失败",
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
    initProductList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
