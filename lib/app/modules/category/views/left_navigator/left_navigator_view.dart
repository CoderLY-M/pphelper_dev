import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/controllers/category_controller.dart';
import 'package:pphelper/app/modules/category/controllers/sub_category_controller.dart';

class LeftNavigatorView extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        builder: (controller) {
          return Container(
            width: ScreenUtil().screenWidth / 5,
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1,color:Colors.black12)
                )
            ),
            child: ListView.builder(
              itemCount:categoryController.categoryModelList.length,
              itemBuilder: (context,index){
                return _categoryWidget(index);
              },
            ),
          );
        }
    );
  }

  //父类组件
  Widget _categoryWidget(index) {
    return InkWell(
      onTap: (){
        //更新当前的下标
        categoryController.updateCategoryIndex(index);
        //更新子类的数据
        categoryController.updateCategories(categoryController.categoryModelList[index]);
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding:const EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
            color: categoryController.categoryIndex == index ? Colors.black12 : Colors.white,
            border:const Border(
                bottom:BorderSide(width: 1,color:Colors.black12)
            )
        ),
        child: Text(
          "${categoryController.categoryModelList[index].title}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:ScreenUtil().setSp(28),
            height: ScreenUtil().setHeight(1.5),
          ),
        ),
      ),
    );
  }
}
