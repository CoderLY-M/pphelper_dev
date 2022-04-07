import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/new_stock/views/stock_detail/stock_detail.dart';

import '../controllers/new_stock_controller.dart';

class NewStockView extends GetView<NewStockController> {
  final NewStockController newStockController = Get.put(NewStockController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上架商品'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: StockDetailView(),
      )
    );
  }
}
