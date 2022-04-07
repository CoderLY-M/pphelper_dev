import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controllers/category_products_controller.dart';
import '../../controllers/sub_category_controller.dart';
import '../product_item/product_item.dart';

/**
 * 商品列表展示
 */

class CategoryProductsView extends StatelessWidget {
  final CategoryProductsController categoryProductsController = Get.put(CategoryProductsController());

  //商品纵向组件
  Widget _verticalProductWidget() {
    return MasonryGridView.count(
      // 展示几列
      crossAxisCount: 2,
      // 元素总个数
      itemCount: categoryProductsController.categoryProductList.length,
      // 单个子元素
      itemBuilder: (BuildContext context, int index) => ProductItem(item: categoryProductsController.categoryProductList[index],),
      // 纵向元素间距
      mainAxisSpacing: 10,
      // 横向元素间距
      crossAxisSpacing: 10,
      //本身不滚动，让外面的singlescrollview来滚动
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true, //收缩，让元素宽度自适应
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductsController>(
        builder: (controller) {
          return Expanded(
              child: SizedBox(
                  width: ScreenUtil().screenWidth - ScreenUtil().screenWidth / 5,
                  height: ScreenUtil().setHeight(200),
                  child: EasyRefresh(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        _verticalProductWidget()
                      ],
                    ),
                    //下拉刷新
                    onRefresh: () async {
                      await Get.find<SubCategoryController>().topDropUpdateSubCategoryProducts(Get.find<SubCategoryController>().subCategoryModel.id.toString());
                    },
                    //上拉加载
                    onLoad: () async {
                      await Get.find<SubCategoryController>().dropUpdateSubCategoryProducts(Get.find<SubCategoryController>().subCategoryModel.id.toString());
                    },
                    footer: BallPulseFooter(),
                  )
              )
          );
        }
    );
  }

}
