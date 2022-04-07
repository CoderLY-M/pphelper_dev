import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pphelper/app/modules/image_picker/models/image_model.dart';

class ImagePickerController extends GetxController {
  // 设置图片宽高
  final imageWidth = 750.0;
  final imageHeight = 424.0;
  final imageWidgetHeightRatio = 750.0 / 424.0; //宽高比
  final _picker = ImagePicker();
  var width = (ScreenUtil().screenWidth - 20 * 4) / 3;
  var height = ((ScreenUtil().screenWidth - 20 * 4) / 3) / (750.0 / 424.0);

  //文件列表
  List<XFile> files = [];

  //选择图片
  pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    //获取文件名称,查找是否有相同的文件
    var isHave = false;
    //上传文件不能大于5张
    if(files.length < 5) {
      for(var i = 0; i < files.length; i++) {
        if(files[i].name == image.name) {
          //存在，不允许添加
          isHave = true;
          //提示
          Fluttertoast.showToast(
              msg: "已添加该图片",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }
      if(!isHave) {
        //进行添加
        files.add(image);
        update();
      }
    }else{
      Fluttertoast.showToast(
          msg: "只能上传5张图片",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  //删除选择的图片
  deletePickImage(XFile file) async {
    //查找图片
    if(file != null) {
      //移除
      await files.remove(file);
    }
    update();
  }

  //更新图片列表


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
