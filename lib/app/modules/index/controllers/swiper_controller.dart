import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/models/swiper_model.dart';
import 'package:pphelper/app/modules/index/providers/home_provider.dart';

class IndexSwiperController extends GetxController {

  var isLoading = true; //是否在加载

  //首页轮播图数据
  List<SwiperModel> swiperImageList = [];

  //初始化轮播图数据
  initSwiperImageData() async {
    try{
      isLoading = true;
      var lists = await HomeProvider.requestSwiperImages();
      if(lists != null) {
        swiperImageList = lists;
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
