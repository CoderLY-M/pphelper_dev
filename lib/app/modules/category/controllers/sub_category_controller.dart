import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/category_controller.dart';
import 'package:pphelper/app/modules/category/controllers/category_products_controller.dart';

import 'package:pphelper/app/modules/category/models/category_model.dart';
import '../models/sub_categort_model.dart';
import '../providers/category_provider.dart';

class SubCategoryController extends GetxController {
  var isLoading = true; //是否在加载
  var subCategoryIndex = 0;  //小类的当前下标
  var subCategoryPageNum = 1;  //小类当前页码
  List<SubCategoryModel> subCategoryList = []; //小类的列表

  SubCategoryModel subCategoryModel = SubCategoryModel(icon: "", id: "", title: "", parentId: "");  //当前的小类数据

  //更新下标及其数据
  updateSubCategoryAndIndex(item,index) {
    //更新下标
    subCategoryIndex = index;
    //更新数据
    subCategoryModel = item;
    updateSubCategoryProducts(item.id);
    updateSubCategoryProductPageNum();
    update();
  }

  //大类改变更新小类数据
  updateSubCategories(list) {
    subCategoryList = list;
    updateSubCategoryProducts(subCategoryList[0].id.toString());
    updateSubCategoryProductPageNum();
    update();
  }

  //更新页码与列表
  updateNoSubCategories(String id) {
    subCategoryList = [];
    subCategoryModel.id = id;
    updateSubCategoryProductPageNum();
    update();
  }

  //更新小类的商品商品数据
  updateSubCategoryProducts(String cid) {
    // 更新当前的小类数据
    Get.find<CategoryProductsController>().updateSubCategoryProducts(cid, true);
    subCategoryPageNum++;
  }

  //下拉刷新小类数据
  dropUpdateSubCategoryProducts(String cid) {
    // 更新当前的小类数据
    Get.find<CategoryProductsController>().dropUpdateSubCategoryProducts(cid, false);
  }

  //顶部下拉刷新
  topDropUpdateSubCategoryProducts(String cid) {
    Get.find<CategoryProductsController>().dropUpdateSubCategoryProducts(cid, true);
  }

  //更新页码
  updateSubCategoryProductPageNum() {
    //更新页码
    Get.find<CategoryProductsController>().updatePageNum();
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
