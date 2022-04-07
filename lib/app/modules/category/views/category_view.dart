import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/category/views/category_products/category_products_view.dart';
import 'package:pphelper/app/modules/category/views/right_navigator/right_navigator.dart';
import '../controllers/category_controller.dart';
import 'left_navigator/left_navigator_view.dart';

/**
 * 分类页面
 */

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品分类"),centerTitle: true,),
      body: Container(
        child: Row(
          children: [
            LeftNavigatorView(),
            Column(
              children: [
                RightNavigatorView(),
                CategoryProductsView()
              ],
            )
          ],
        ),
      ),
    );
  }
}
