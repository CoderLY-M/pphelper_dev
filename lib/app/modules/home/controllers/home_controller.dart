import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  //当前下标页面
  var currentIndexPage = 0;

  static HomeController to = Get.find();

  //改变当前的页面下标
  changePageIndex(int index) {
    currentIndexPage = index;
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
