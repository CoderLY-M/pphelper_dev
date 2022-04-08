import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/collection/models/collection_model.dart';
import 'package:pphelper/app/modules/member/controllers/member_status_controller.dart';
import 'package:pphelper/app/service/collection_service.dart';


class CollectionController extends GetxController {
  //我的收藏的商品
  List<CollectionModel> collectionProducts = [];

  //从服务中心获取我的收藏数据数据
  updateCollectionProducts() {
    Get.find<CollectionService>().getCollectionProducts().then((collectionList){
      collectionProducts = collectionList;
      Get.find<MemberStatusController>().updateCollectionProducts();
      update();
    });
  }

  //添加一件商品到我的收藏
  addCollectionProduct(collectionProductModel) async {
    try{
      await Get.find<CollectionService>().addCollectionProduct(collectionProductModel);
      //刷新商品数据
      updateCollectionProducts();
    }catch(e){
      throw Exception(e);
    }
  }

  //从我的收藏移除一件商品
  removeBusProduct(var pid) async{
    try{
      await Get.find<CollectionService>().removeCollectionProduct(pid);
      //刷新我的收藏数据
      updateCollectionProducts();
    }catch(e){
      throw Exception(e);
    }
  }

  Future<bool> productIsCollection(var pid) async {
    bool isCollection = await Get.find<CollectionService>().productIsCollectionProduct(pid);
    return isCollection;
  }

  @override
  void onInit() async{
    super.onInit();
    updateCollectionProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
