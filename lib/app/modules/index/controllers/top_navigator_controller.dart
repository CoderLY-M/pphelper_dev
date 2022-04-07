import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/models/category_model.dart';
import 'package:pphelper/app/modules/index/models/swiper_model.dart';
import 'package:pphelper/app/modules/index/providers/home_provider.dart';

class TopNavigatorController extends GetxController {

  var isLoading = true; //是否在加载

  //首页分类数据
  List<CategoryModel> categoryModelList = [];

  //初始化首页分类数据
  initCategoryImageData() async {
    try{
      isLoading = true;
      var lists = await HomeProvider.requestCategories();
      if(lists != null) {
        categoryModelList = lists;
      }
    }finally{
      isLoading = false;
    }
    update();
  }
  @override
  void onInit() {
    super.onInit();
    initCategoryImageData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
