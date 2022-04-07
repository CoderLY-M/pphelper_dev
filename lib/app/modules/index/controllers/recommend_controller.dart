import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/models/recommend_model.dart';
import 'package:pphelper/app/modules/index/models/swiper_model.dart';
import 'package:pphelper/app/modules/index/providers/home_provider.dart';

class RecommendController extends GetxController {

  var isLoading = true; //是否在加载

  //推荐商品数据
  List<RecommendModel> recommendList = [];

  //初始化推荐商品数据
  initSwiperImageData() async {
    try{
      isLoading = true;
      var lists = await HomeProvider.requestRecommendProducts();
      if(lists != null) {
        recommendList = lists;
      }
    }finally{
      isLoading = false;
    }
    update();
  }
  @override
  void onInit() {
    super.onInit();
    initSwiperImageData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
