import 'package:get/get.dart';

class ProductDetailTabberController extends GetxController {

  bool isLeft = true; //是否在左边
  bool isRight = false; //是否在右边


  //改变tabber的状态
  changTabberDirection(String status) {
    if(status == "left") {
      isLeft = true;
      isRight = false;
      //获取详细数据
    }else{
      isLeft = false;
      isRight = true;
      //获取评论数据
    }
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
