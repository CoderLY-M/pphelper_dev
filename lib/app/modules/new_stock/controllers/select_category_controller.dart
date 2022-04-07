

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../category/models/category_model.dart';
import '../../index/providers/home_provider.dart';

class SelectCategoryController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    initCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //分类数据
  var categoryData = [];
  //当前选择的分类
  var selectCategory = [];
  //当前选择的分类名称
  var selectCategoryName = "";

  //初始化分类数据
  initCategoryData() async{
    try{
      var lists = await HomeProvider.requestCategories();
      var tempList = [];
      if(lists != null) {
        var categoryList = lists;
        for (var value in categoryList) {
          var categoryMap = new HashMap();
          categoryMap["label"] = value.title;
          categoryMap["value"] = value.id;
          var subTempList = value.subCategories?.toList();
          if(subTempList != null && subTempList.length != 0) {
            //有数据
            var subCategoryList = [];
            for (var value in subTempList) {
              var subCategoryMap = new HashMap();
              subCategoryMap["label"] = value.title;
              subCategoryMap["value"] = value.id;
              subCategoryMap["children"] = [];
              subCategoryList.add(subCategoryMap);
            }
            categoryMap["children"] = subCategoryList;
          }
          tempList.add(categoryMap);
        }
        //更新
        categoryData = tempList;
        //update()
      }
    }catch(e) {
      Fluttertoast.showToast(
          msg: "初始化分类数据失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    update();
  }

  //获取数据
  List<PickerItem<String>> getCategoryData(List data, {String label = 'label', String value = 'value', String children = 'children'}) {
    //遍历生成相对应的PickerItem
    List<PickerItem<String>> list = data.map((item) {
      //pickerItem的类型为PickerItem<String> 不指明类型会报错
      PickerItem<String> pickerItem = PickerItem(
        text: Text(item[label]),
        value: item[value],
        //如果子项有数据就递归，否则子项的children就是空List
        children: item.containsKey(children) && item[children].length > 0 ? getCategoryData(item[children]) : []
      );
      //最终把遍历的每一项返出去
      return pickerItem;
    }).toList();
    return list;
  }

  //更新选择的分类数据
  updateSelectCategory(List selectValues) {
    //大类选择
    if(selectValues.length == 1) {
      for (var category in categoryData) {
        if(category["value"] == selectValues[selectValues.length - 1]) {
          //找到了大类,获取大类title
          selectCategoryName = category["label"];
        }
      }
    }else{
      //选择的是小类
      var subSelectValue = selectValues[selectValues.length - 1];
      //大类列表
      List tempSubCategoryList = [];
      //寻找大类
      for (var category in categoryData) {
        if(category["value"] == selectValues[0]){
          //找到了大类，获取大类的名称与小类的列表
          selectCategoryName = category["label"];
          tempSubCategoryList = category["children"];
        }
      }
      //寻找小类
      for (var subCategory in tempSubCategoryList) {
        if(subCategory["value"] == subSelectValue){
          //找到了大类，获取大类的名称与小类的列表
          selectCategoryName = selectCategoryName + " / " + subCategory["label"];
        }
      }
    }
    selectCategory = selectValues;
    update();
  }
}