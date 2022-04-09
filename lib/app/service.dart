import 'package:get/get.dart';
import 'package:pphelper/app/service/collection_service.dart';
import 'package:pphelper/app/service/history_service.dart';
import 'package:pphelper/app/service/member_service.dart';
import 'package:pphelper/app/service/storage_service.dart';

/**
 * 服务列表
 */
class PphelperService {
  static startService() async {
    print('开启服务...');
    await initStoreService();
    await initMemberService();
    await initCollectionService();
    await initSearchHistoryService();
    print('服务已启动...');
  }

  //启动购物车服务
  static initStoreService() async {
    print("启动购物车服务....");
    await Get.putAsync(() async => await StorageService());
    print("购物车服务已启动....");
  }

  //启动用户服务
  static initMemberService() async {
    print("启动用户服务....");
    await Get.putAsync(() async => await MemberService());
    print("用户服务已启动....");
  }

  //启动我的收藏服务
  static initCollectionService() async {
    print("启动收藏服务....");
    await Get.putAsync(() async => await CollectionService());
    print("收藏服务已启动....");
  }

  //启动我的收藏服务
  static initSearchHistoryService() async {
    print("启动搜索历史服务....");
    await Get.putAsync(() async => await HistoryService());
    print("搜索历史服务已启动....");
  }
}