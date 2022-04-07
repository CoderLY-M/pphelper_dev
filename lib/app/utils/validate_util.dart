import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * 校验工具类
 */

class ValidateUtil {
  /**
   * 校验价格
   */
  static bool validatePrice(String value) {
    var parseNumber = 0.0;
    if(value.isEmpty) {
      //不为空
      Fluttertoast.showToast(
          msg: "商品价格不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    //必须为数字
    try{
      parseNumber = double.parse(value);
    }catch(e) {
      //转化失败
      Fluttertoast.showToast(
          msg: "商品价格必须为数字",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    //必须大于0
    if(parseNumber <= 0) {
      Fluttertoast.showToast(
          msg: "商品价格必须大于0",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    //超出范围
    if(parseNumber >= double.maxFinite) {
      Fluttertoast.showToast(
          msg: "商品价格必须超出数字范围",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

  //校验商品名称
  static bool validateProductName(String value) {
    if(value.isEmpty) {
      //不为空
      Fluttertoast.showToast(
          msg: "商品名称不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(value.length > 25) {
      Fluttertoast.showToast(
          msg: "商品名称长度超出范围",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

  //校验商品描述
  static bool validateProductDesc(String value) {
    if(value.isEmpty) {
      //不为空
      Fluttertoast.showToast(
          msg: "商品描述不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(value.length > 50) {
      Fluttertoast.showToast(
          msg: "商品描述长度超出范围",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

  //校验商品数量
  static bool validateProductCount(String value) {
    int count = 0;
    if(value.isEmpty) {
      //不为空
      Fluttertoast.showToast(
          msg: "商品数量不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    try{
      count = int.parse(value);
    }catch(e) {
      Fluttertoast.showToast(
          msg: "商品数量不为整数",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(count <= 0) {
      Fluttertoast.showToast(
          msg: "商品数量必须大于0",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(count > 100000) {
      Fluttertoast.showToast(
          msg: "商品数量大于了规定上架的值（100000）",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

  //校验分类
  static bool validateProductCategory(var value) {
    if(value.length <= 0) {
      Fluttertoast.showToast(
          msg: "商品分类不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

  //校验图片
  static bool validateProductImages(var value) {
    if(value.length <= 0) {
      Fluttertoast.showToast(
          msg: "上传图片不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }
}