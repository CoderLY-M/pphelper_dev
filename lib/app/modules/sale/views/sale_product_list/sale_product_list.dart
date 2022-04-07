import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/sale/controllers/sale_controller.dart';

import '../sale_product_item/sale_product_item.dart';

/**
 * 挂售商品列表
 */
class SaleProductListView extends StatelessWidget {
  SaleController saleController = Get.put(SaleController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleController>(
      //获取列表数据
        builder: (controller) {
          return Container(
              child: ListView.builder(
                  itemCount: saleController.saleProducts.length,
                  itemBuilder: (builder, index) {
                    return SaleProductItemView(saleProduct: saleController.saleProducts[index],);
                  }
              )
          );
        }
    );
  }
}
