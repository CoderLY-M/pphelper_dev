import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/sub_category_controller.dart';
import 'package:pphelper/app/modules/category/models/category_model.dart';
import 'package:pphelper/app/modules/category/models/category_product_model.dart';
import '../providers/category_provider.dart';

class CategoryProductsController extends GetxController {
  var isLoading = true; //是否在加载
  List<CategoryProductModel> categoryProductList = [];  //分类数据
  var currentPageNum = 1;

  //初始化数据
  updateSubCategoryProducts(String subCategoryId, bool reset) async {
    if(reset) {
      currentPageNum = 1;
    }
    //当前页码
    try{
      isLoading = true;
      var lists = await CategoryProvider.requestProductsByCategoryId(subCategoryId,pageNum: currentPageNum);
      if(lists != null) {
        categoryProductList = lists;
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "获取分类商品数据失败~~~~",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }finally{
      isLoading = false;
      currentPageNum++;
    }
    update();
  }

  //下拉刷新小类数据
  dropUpdateSubCategoryProducts(String subCategoryId, bool reset) async {
    //当前页码
    if(reset) currentPageNum = 1;
    try{
      isLoading = true;
      var lists = await CategoryProvider.requestProductsByCategoryId(subCategoryId,pageNum: currentPageNum);
      if(lists != null && lists.length != 0) {
        if(reset){
          categoryProductList = lists;
        }else{
          categoryProductList.addAll(lists);
        }
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
        categoryProductList = [];
      }
    }finally{
      isLoading = false;
      currentPageNum++;
    }
    update();
  }

  //更新当前页码数据
  updatePageNum() {
    currentPageNum = 1;
    update();
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
  void onClose() {}
}
