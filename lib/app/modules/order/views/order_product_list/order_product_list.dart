import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/order/controllers/order_controller.dart';
import 'package:pphelper/app/modules/order/views/order_product_item/order_product_item.dart';
/**
 * 订单列表
 */
class OrderProductListView extends StatelessWidget {
  const OrderProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (controller) {
          var orderList = controller.orderList;
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Container(
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (builder, index) {
                  return OrderProductItemView(item: orderList[index],);
                }
              )
            );
          }
        }
    );
  }
}
