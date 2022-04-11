import 'package:get/get.dart';
import 'package:pphelper/app/modules/order/controllers/order_controller.dart';
import 'package:pphelper/app/modules/order/models/order_model.dart';
import 'package:pphelper/app/modules/order/providers/order_provider.dart';

import '../../../service/collection_service.dart';
import '../../../service/member_service.dart';
import '../../sale/providers/sale_provider.dart';

class MemberStatusController extends GetxController {

  //收藏数量
  var collectionCount = 0;
  //订单总数
  var orderCounts = 0;
  //挂售商品数量
  var saleCount = 0;

  cleanMemberStatus() {
    collectionCount = 0;
    orderCounts = 0;
    saleCount = 0;
    update();
  }

  //更新我的收藏数量
  updateCollectionProducts() {
    Get.find<CollectionService>().getCollectionProducts().then((collectionList){
      collectionCount = collectionList.length;
      update();
    });
  }

  //更新订单的数量
  updateOrderList() async{
    var loginMember =await Get.find<MemberService>().getLoginMember();
    var memberId = loginMember?.id;
    var list = await OrderProvider.requestOrderList(memberId, 0);
    if(list != null) {
      orderCounts = list.length;
    }
    update();
  }

  //更新挂售商品数量
  updateSaleOutProducts() async{
    var loginMember =await Get.find<MemberService>().getLoginMember();
    var memberId = loginMember?.id;
    try{
      var counts = await SaleProvider.requestSaleCountsByMid(memberId!);
      saleCount = counts;
    }catch(e) {
      saleCount = 0;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    updateCollectionProducts();
    updateSaleOutProducts();
    updateOrderList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
