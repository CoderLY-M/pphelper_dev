import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/product_detail/controllers/product_detail_tabber_controller.dart';
import '../product_detail_web/product_detail_web.dart';

class ProductDetailTabberView extends StatelessWidget {
  final ProductDetailTabberController productDetailTabberController = Get.put(ProductDetailTabberController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailTabberController>(
        builder: (controller) {
          return Container(
              width: ScreenUtil().screenWidth,
              constraints: const BoxConstraints(
                  minHeight: 300
              ),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TabberLeft(),
                      TabberRight(),
                    ],
                  ),
                  ProductDetailWebView()
                ],
              )
          );
        }
    );
  }
}

/**
 * 左边的tabber
 */
class TabberLeft extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailTabberController>(
        builder: (controller) {
          return Container(
            width: ScreenUtil().screenWidth / 2 - 25,
            child: InkWell(
              onTap: () {
                //改变状态
                controller.changTabberDirection("left");
              },
              child: Container(
                padding:EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: controller.isLeft ?Colors.pink:Colors.black12
                        )
                    )
                ),
                child: Text(
                  '详细',
                  style: TextStyle(
                      color:controller.isLeft ? Colors.pink:Colors.black
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

/**
 * 右边的tabber
 */
class TabberRight extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailTabberController>(
        builder: (controller) {
          return Container(
            width: ScreenUtil().screenWidth / 2 - 25,
            child: InkWell(
              onTap: () {
                controller.changTabberDirection("right");
              },
              child: Container(
                padding:EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: controller.isRight ? Colors.pink:Colors.black12
                        )
                    )
                ),
                child: Text(
                  '评论',
                  style: TextStyle(
                      color:controller.isRight? Colors.pink:Colors.black
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}