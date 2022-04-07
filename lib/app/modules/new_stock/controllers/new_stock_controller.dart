import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pphelper/app/modules/new_stock/models/stock_model.dart';
import 'package:pphelper/app/service/member_service.dart';

import '../providers/stock_provider.dart';

class NewStockController extends GetxController {
  var success = false;
  var isLoading = false;
  //当前需要上架的商品
  var stockModel;

  //更新上架的商品并上架
  updateStockModel(StockModel model, List<XFile> list) async {
    //获取当前的用户
    var memberModel = await Get.find<MemberService>().getLoginMember();
    model.memberId = memberModel?.id;
    stockModel = model;
    //上传文件
    var imageUrls = await uploadFiles(list);
    if(imageUrls != null && imageUrls.length != 0) {
      //上架商品
      toStockModel(imageUrls);
    }else{
      Fluttertoast.showToast(
          msg: "商品上架失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  //上传文件
  Future<List<String>> uploadFiles(List<XFile> list) async{
    List<String> imageUrls = [];
    try{
      var tempLists = await StockProvider.uploadImageFiles(list);
      imageUrls = tempLists.cast<String>();
      Fluttertoast.showToast(
          msg: "图片上传成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch(e) {
      Fluttertoast.showToast(
          msg: "图片上传失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }finally{
      return imageUrls;
    }
  }

  //上架商品
  toStockModel(List<String> imageUrls) async{
    success = false;
    isLoading = true;
    try{
      stockModel.imageUrl = imageUrls;
      await StockProvider.requestNewStock(stockModel);
      success = true;
      Fluttertoast.showToast(
          msg: "商品上架成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }catch (e){
      //登录失败
      success = false;
      Fluttertoast.showToast(
          msg: "商品上架失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }finally{
      isLoading = false;
      stockModel = null;
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
