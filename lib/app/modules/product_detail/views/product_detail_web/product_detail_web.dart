import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/product_detail_controller.dart';

/**
 * 详情页面网页显示
 */

class ProductDetailWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        builder: (controller) {
          //当前商品
          var productModel = controller.productModel;
          var productDetail = productModel.productDetail;
          if(productDetail != null && productDetail != "") {
            return Container(
              child: Html(
                data: productDetail,
              ),
            );
          }else{
            return Container(
              child: Html(
                data: "<p style='text-align: center;'>暂时还有数据哦<p>",
              ),
            );
          }
        }
    );
  }
}
