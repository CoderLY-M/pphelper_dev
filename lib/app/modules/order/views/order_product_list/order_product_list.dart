import 'package:flutter/material.dart';
import 'package:pphelper/app/modules/order/views/order_product_item/order_product_item.dart';
/**
 * 订单列表
 */
class OrderProductListView extends StatelessWidget {
  const OrderProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
          OrderProductItemView(),
        ],
      ),
    );
  }
}
