import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/search/models/search_product_model.dart';
import 'package:pphelper/app/modules/search/providers/search_provider.dart';

import '../../../service/history_service.dart';


class SearchController extends GetxController {
  //是否在加载
  var isLoading = false;
  //推荐商品列表
  List<String> recommendList = [];
  //搜索商品列表
  List<SearchProductModel> searchProducts = [];
  //历史记录
  List<String> searchHistory = [];

  //商品数据的改变
  initRecommendList() async{
    try{
      var list = await SearchProvider.requestRecommendProducts();
      recommendList = list;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取推荐商品数据失败~~~~",
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

  //初始化历史记录数据
  initSearchHistoryData() async{
    try{
      var list = await Get.find<HistoryService>().getSearchHistory();
      searchHistory = list;
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取搜索历史记录失败~~~~",
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

  //向历史记录添加数据
  insertHistoryData(String productName) async{
    try{
      await Get.find<HistoryService>().insertSearchHistory(productName).then((value) async{
        //获取数据
        await initSearchHistoryData();
      });
    }catch(e) {
      Fluttertoast.showToast(
          msg: "添加搜索历史记录失败~~~~",
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

  //删除所有的历史记录
  cleanHistoryData() async{
    try{
      await Get.find<HistoryService>().cleanSearchHistory().then((value) async{
        //获取数据
        initSearchHistoryData();
      });
    }catch(e) {
      Fluttertoast.showToast(
          msg: "清空搜索历史记录失败~~~~",
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

  //更新搜索数据
  updateSearchProductList(String queryData) async{
    try{
      isLoading = true;
      var queryProducts = await SearchProvider.requestProductsByQueryData(queryData);
      if(queryProducts.length != 0) {
        searchProducts = queryProducts;
      }else{
        Fluttertoast.showToast(
            msg: "没有搜索到需要的商品~~~~",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16.0
        );
        searchProducts = [];
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "搜索商品失败~~~~",
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
}
