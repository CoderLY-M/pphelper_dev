import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/sub_category_controller.dart';

import 'package:pphelper/app/modules/category/models/category_model.dart';
import '../providers/category_provider.dart';
import 'category_products_controller.dart';

class CategoryController extends GetxController {
  var isLoading = true; //是否在加载
  var categoryIndex = 0;  //大类的当前下标

  //首页分类数据
  List<CategoryModel> categoryModelList = [];

  //初始化大类数据
  initCategoryData() async {
    try{
      isLoading = true;
      var lists = await CategoryProvider.requestCategories();
      if(lists != null) {
        categoryModelList = lists;
      }
    }finally{
      isLoading = false;
    }
    updateCategories(categoryModelList[categoryIndex]);
    update();
  }

  //更新分类数据
  updateCategories(CategoryModel categoryModel) {
    // 更新当前的分类数据
    if(categoryModel.subCategories?.length == 0) {
      Get.find<CategoryProductsController>().updateSubCategoryProducts(categoryModel.id!, true);
      Get.find<SubCategoryController>().updateNoSubCategories(categoryModel.id!);
      update();
    }else{
      //更新小类数据
      Get.find<SubCategoryController>().updateSubCategories(categoryModel.subCategories);
    }
  }

  //更新下标
  updateCategoryIndex(index) {
    categoryIndex = index;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    initCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
