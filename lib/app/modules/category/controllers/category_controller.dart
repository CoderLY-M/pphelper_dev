import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/sub_category_controller.dart';

import 'package:pphelper/app/modules/category/models/category_model.dart';
import 'package:pphelper/app/modules/category/models/sub_categort_model.dart';
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
        initCategoryHeader();
      }
    }finally{
      isLoading = false;
    }
    updateCategories(categoryModelList[categoryIndex]);
    update();
  }

  //构造头部
  initCategoryHeader() {
    if(categoryModelList.length != 0) {
      categoryModelList.forEach((categoryModel) {
        SubCategoryModel categoryModelHeader = new SubCategoryModel();
        categoryModelHeader.id = categoryModel.id;
        categoryModelHeader.title = "全部";
        categoryModelHeader.icon = categoryModel.icon;
        categoryModelHeader.parentId = categoryModel.parentId;
        //将头部加入到分类中
        var newSubCategories = [];
        newSubCategories.add(categoryModelHeader);
        categoryModel.subCategories?.forEach((element) {
          newSubCategories.add(element);
        });
        categoryModel.subCategories = newSubCategories.cast<SubCategoryModel>();
      });
    }
  }

  //更新分类数据
  updateCategories(CategoryModel categoryModel) {
    //更新小类数据
    Get.find<SubCategoryController>().updateSubCategories(categoryModel.subCategories);
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
