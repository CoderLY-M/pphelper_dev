
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/collection/models/collection_model.dart';

/**
 * 我的收藏数据
 */

class CollectionService extends GetxService {

  //向我的收藏中商品数据
  Future<void> addCollectionProduct(CollectionModel collectionModel) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    var isHave = false;
    tempList.forEach((element) {
      if(element["id"] == collectionModel.id) {
        isHave = true;
      }
    });
    //没有该商品，增加商品
    if(!isHave) {
      tempList.add({
        "id": collectionModel.id,
        "imageUrl": collectionModel.imageUrl,
        "productName": collectionModel.productName,
        "productDesc": collectionModel.productDesc,
        "productPrice": collectionModel.productPrice,
      });
    }
    //把字符串encode处理
    busProductList = json.encode(tempList).toString();
    sharedPreferences.setString("collectionProducts", busProductList);
  }

  //从我的收藏中取出所有商品数据
  Future<List<CollectionModel>> getCollectionProducts() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<dynamic> tempList =(busProductStr as List).cast();
    List<CollectionModel> busList = [];
    tempList.forEach((item){
      CollectionModel tempCollection = CollectionModel(
        id: item["id"],
        imageUrl: item["imageUrl"],
        productName: item["productName"],
        productPrice: item["productPrice"],
        productDesc: item["productDesc"],
      );
      busList.add(tempCollection);
    });
    return busList;
  }

  //清空我的收藏的商品
  Future<void> cleanCollectionProducts() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("collectionProducts");
  }

  //通过商品id从我的收藏中移除商品
  Future<void> removeCollectionProduct(String pid) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    var isHave = false;
    //需要移除的商品
    var needRvItem;
    tempList.forEach((element) {
      if(element["id"] == pid) {
        isHave = true;
        needRvItem = element;
      }
    });
    if(isHave) {
      tempList.remove(needRvItem);
      //把字符串encode处理
      busProductList = json.encode(tempList).toString();
      sharedPreferences.setString("collectionProducts", busProductList);
    }
  }

  //通过商品id从查看商品是否以及收藏
  Future<bool> productIsCollectionProduct(String pid) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    var isHave = false;
    //需要移除的商品
    tempList.forEach((element) {
      if(element["id"] == pid) {
        isHave = true;
      }
    });
    if(isHave) {
      return true;
    }else{
      return false;
    }
  }

}