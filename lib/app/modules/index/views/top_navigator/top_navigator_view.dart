import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/index/controllers/top_navigator_controller.dart';
/**
 * 顶部导航分类栏目
 */
class TopNavigatorView extends StatelessWidget {
  TopNavigatorController topNavigatorController = Get.put(TopNavigatorController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<TopNavigatorController>(
            builder: (controller) {
              //获取数据
              var categoryModelList = topNavigatorController.categoryModelList;
              return Column(
                children: [
                  _recommendTitleWidget(),
                  Container(
                    height: ScreenUtil().setHeight(320),
                    padding: EdgeInsets.all(8.0),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 5,
                      children: categoryModelList.map((item){
                        return _griwViewItemUI(context, item);
                      }).toList().cast(),
                    ),
                  ),
                ],
              );
            }
        )
    );
  }

  //渲染单个图标
  _griwViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.only(left: 4,right: 4),
        child: Wrap(
          children: [
            CategoryImageWidget(url: item.icon, title: item.title,),
          ],
        ),
      ),
    );
  }

  //标题
  Widget _recommendTitleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
        decoration: BoxDecoration(
            color:Colors.white,
            border: Border(
                bottom: BorderSide(width:0.5,color:Colors.black12)
            )
        ),
        child:Text(
            '商品分类',
            style:TextStyle(color:Colors.blue)
        )
    );
  }
}
