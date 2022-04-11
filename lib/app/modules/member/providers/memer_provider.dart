

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../service/service_url.dart';
import '../../login/models/member_model.dart';
import '../../new_stock/providers/images_form.dart';

class MemberProvider extends GetxService {
  //用户修改请求
  static Future<MemberModel?> updateLoginUser(MemberModel memberModel) async {
    var dio = Dio();
    var jsonStr = json.encode(memberModel);
    var response = await dio.post(servicePath['updateMember'].toString(), data: jsonStr);
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //成功登录
        return MemberModel.fromJson(response.data["data"]["member"]);
      }else{
        throw Exception("更新用户失败");
      }
    }else{
      throw Exception("更新用户请求失败");
    }
  }

  //上传头像图片请求
  static Future<List<dynamic>> uploadAvatarImageFiles(List<XFile> imageFiles) async {
    var formData = await ImagesForm.getFormData(imageFiles);
    var response = await Dio().post(servicePath['uploadImages'].toString(), data: formData);
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        //获取上传的文件名称
        return response.data["data"]["imageUrls"];
      }else{
        throw Exception("头像图片上传失败");
      }
    }else{
      throw Exception("头像图片上传请求失败");
    }
  }
}