import 'package:flutter/material.dart';

import '../sale_product_item/sale_product_item.dart';

/**
 * 挂售商品列表
 */
class SaleProductListView extends StatelessWidget {
  const SaleProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SaleProductItemView(),
          SaleProductItemView(),
        ],
      ),
    );
  }
}
