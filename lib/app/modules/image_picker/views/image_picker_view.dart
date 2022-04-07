import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:pphelper/app/modules/image_picker/controllers/image_picker_controller.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

class ImagePickerView extends StatelessWidget {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ImagePickerController>(
        builder: (controller) {
          //获取图片长度
          var files = controller.files;
          List<Widget> list = files.map((item) => wrapper(item)).toList()..add(addButton());
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
          width: imagePickerController.width,
          height: imagePickerController.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: -20,
            top: -20,
            child: IconButton(
              onPressed: () {
                //删除图片
                imagePickerController.deletePickImage(file);
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
          await imagePickerController.pickImage();
        },
        child: Container(
          width: (ScreenUtil().screenWidth - 10 * 4) / 3,
          height: imagePickerController.height,
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

