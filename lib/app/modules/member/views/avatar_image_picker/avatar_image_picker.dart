import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../member/controllers/avatar_image_picker_controller.dart';


class AvatarImagePickerView extends StatelessWidget {
  final AvatarImagePickerController avatarImagePickerController = Get.put(AvatarImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<AvatarImagePickerController>(
        builder: (controller) {
          //获取图片长度
          var files = controller.files;
          List<Widget> list = [];
          if(files.length < 1) {
            list = files.map((item) => wrapper(item)).toList()..add(addButton());
          }else{
            list = files.map((item) => wrapper(item)).toList();
          }
          return Container(
              padding: EdgeInsets.all(10),
              child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: list
              )
          );
        },
      ),
    );
  }

  //单个图片组件
  Widget wrapper(XFile file) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.file(
          File(file.path),
          width: avatarImagePickerController.width,
          height: avatarImagePickerController.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: -20,
            top: -20,
            child: IconButton(
              onPressed: () {
                //删除图片
                avatarImagePickerController.deletePickImage(file);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            )
        )
      ],
    );
  }

  //添加按钮
  Widget addButton() {
    return Container(
        child: GestureDetector(
          onTap: () async {
            await avatarImagePickerController.pickImage();
          },
          child: Container(
            width: (ScreenUtil().screenWidth - 10 * 4) / 3,
            height: avatarImagePickerController.height,
            color: Colors.grey,
            child: Center(
              child: Text(
                '+',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
              ),
            ),
          ),
        )
    );
  }
}

