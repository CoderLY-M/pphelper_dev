import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/sub_category_controller.dart';

/**
 * 右侧导航分类栏
 */

class RightNavigatorView extends StatelessWidget {
  final SubCategoryController subCategoryController = Get.put(SubCategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubCategoryController>(
        builder: (controller) {
          var subCategoryList = subCategoryController.subCategoryList;
          return Container(
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().screenWidth - ScreenUtil().screenWidth / 5,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12)
                )
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: subCategoryList.length,
                itemBuilder: (context, index) {
                  return _subCategoryWidget(subCategoryList[index],index);
                }
            ),
          );
        }
    );
  }

  //单个子类显示
  Widget _subCategoryWidget(item,index) {
    return InkWell(
      onTap: () {
        //更新当前的下标及其数据
        subCategoryController.updateSubCategoryAndIndex(item,index);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Text(
          "${item.title}",
          style: TextStyle(
            color: subCategoryController.subCategoryIndex == index ? Colors.blue : Colors.grey,
            fontSize: ScreenUtil().setSp(28),
            height: ScreenUtil().setHeight(2.5),
          ),
        ),
      ),
    );
  }
}

