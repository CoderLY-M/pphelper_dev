import 'package:get/get.dart';

class OrderController extends GetxController {

  /**
   * 当前tabber的下标
   * 0：表示全部订单
   * 1：表示待付款订单
   * 2：表示待发货订单
   * 3：表示待收货订单
   * 4：表示待评价订单
   */
  int tabberIndex = 0;

  //更新下标
  updateTabberIndex(int index) {
    tabberIndex = index;
    update();
  }

  //获取/更新订单数据


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
