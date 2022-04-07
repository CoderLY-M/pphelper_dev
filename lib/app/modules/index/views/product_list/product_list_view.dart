import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pphelper/app/modules/index/controllers/home_product_controller.dart';
import 'package:pphelper/app/modules/index/controllers/recommend_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import '../../../common/image_widget/image_widget.dart';
import '../../controllers/swiper_controller.dart';

/**
 * 首页商品列表页面
 */

class ProductListView extends StatelessWidget {

  final HomeProductController homeProductController = Get.put(HomeProductController());

  //商品列表的标题
  Widget _productListTitleWidget() {
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
            '在售商品',
            style:TextStyle(color:Colors.blue)
        )
    );
  }

  //商品纵向组件
  Widget _verticalProductWidget() {
    return GetBuilder<HomeProductController>(
        builder: (controller) {
          var productList = homeProductController.productList;
          return MasonryGridView.count(
            // 展示几列
            crossAxisCount: 2,
            // 元素总个数
            itemCount: productList.length,
            // 单个子元素
            itemBuilder: (BuildContext context, int index) => _productItem(productList[index]),
            // 纵向元素间距
            mainAxisSpacing: 10,
            // 横向元素间距
            crossAxisSpacing: 10,
            //本身不滚动，让外面的singlescrollview来滚动
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true, //收缩，让元素宽度自适应
          );
        }
    );
  }

  //商品项
  Widget _productItem(item){
    return InkWell(
      onTap:() async {
        //点击会更新商品的浏览量
        await homeProductController.refreshProductViewCount(item.id);
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": item.id});
      },
      child: Container(
        width: ScreenUtil().setWidth(350),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width:0.5,color:Colors.black12),
              left: BorderSide(width:0.5,color:Colors.black12),
              right: BorderSide(width:0.5,color:Colors.black12),
              bottom: BorderSide(width:0.5,color:Colors.black12),
            ),
            borderRadius: new BorderRadius.circular((10.0))
        ),
        child: Column(
          children: [
            Container(
              child: ImageWidget(url: item.imageUrl,),
            ),
            Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                "${item.productName}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    height: ScreenUtil().setHeight(2)
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "￥${item.productPrice}",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenUtil().setSp(25),
                      height: ScreenUtil().setHeight(1.5)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text("浏览量:${item.viewCount}",style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    height: ScreenUtil().setHeight(3),
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _productListTitleWidget(),
          _verticalProductWidget()
        ],
      ),
    );
  }
}

