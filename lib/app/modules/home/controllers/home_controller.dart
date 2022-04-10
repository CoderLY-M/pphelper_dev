import 'package:get/get.dart';
import 'package:pphelper/app/modules/message/controllers/message_controller.dart';

class HomeController extends GetxController {

  //当前下标页面
  var currentIndexPage = 0;

  static HomeController to = Get.find();

  //改变当前的页面下标
  changePageIndex(int index) async{
    currentIndexPage = index;
    update();
    if(index == 2) {
      await Get.find<MessageController>().updateChartMemberList();
    }
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
