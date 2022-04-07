
import 'dart:convert';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 我的收藏数据
 */

class CollectionService extends GetxService {

  //向我的收藏中商品数据
  Future<void> addCollectionProduct(BusProductModel busProductModel) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    var isHave = false;
    tempList.forEach((element) {
      if(element["id"] == busProductModel.id) {
        isHave = true;
      }
    });
    //没有该商品，增加商品
    if(!isHave) {
      tempList.add({
        "id": busProductModel.id,
        "imageUrl": busProductModel.imageUrl,
        "count": busProductModel.count,
        "productName": busProductModel.productName,
        "isCheck": false,
        "productPrice": busProductModel.productPrice,
      });
    }
    //把字符串encode处理
    busProductList = json.encode(tempList).toString();
    sharedPreferences.setString("collectionProducts", busProductList);
  }

  //从我的收藏中取出所有商品数据
  Future<List<BusProductModel>> getCollectionProducts() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<dynamic> tempList =(busProductStr as List).cast();
    List<BusProductModel> busList = [];
    tempList.forEach((item){
      BusProductModel tempBus = BusProductModel(
        id: item["id"],
        imageUrl: item["imageUrl"],
        count: item["count"],
        productName: item["productName"],
        isCheck: item["isCheck"],
        productPrice: item["productPrice"],
      );
      busList.add(tempBus);
    });
    return busList;
  }

  //清空我的收藏的商品
  Future<void> cleanCollectionProducts() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("collectionProducts");
  }

  //通过商品id从购物车中移除一件商品
  Future<void> removeBusProduct(String pid) async{
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

  //通过商品id从我的收藏中移除商品
  Future<void> decrementCollectionProduct(String pid) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("collectionProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    var isHave = false;
    //需要移除的商品
    tempList.forEach((element) {
      if(element["id"] == pid) {
        removeBusProduct(pid);
        isHave = true;
      }
    });
    if(isHave) {
      //把字符串encode处理
      busProductList = json.encode(tempList).toString();
      sharedPreferences.setString("collectionProducts", busProductList);
    }
  }

  //更新所有商品是否选中
  Future<void> updateBusProductAllCheck(flag) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("busProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    tempList.forEach((element) {
      element["isCheck"] = flag;
    });
    //把字符串encode处理
    busProductList = json.encode(tempList).toString();
    sharedPreferences.setString("busProducts", busProductList);
  }

  //更新一件商品是否选中
  Future<void> updateBusProductOneCheck(pid, flag) async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var busProductList = sharedPreferences.getString("busProducts");
    var busProductStr = busProductList == null ? []: json.decode(busProductList);
    List<Map> tempList =(busProductStr as List).cast();
    tempList.forEach((element) {
      if(element["id"] == pid) {
        element["isCheck"] = flag;
      }
    });
    //把字符串encode处理
    busProductList = json.encode(tempList).toString();
    sharedPreferences.setString("busProducts", busProductList);
  }

}