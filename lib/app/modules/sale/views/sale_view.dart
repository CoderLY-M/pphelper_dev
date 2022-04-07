import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/sale/views/sale_product_list/sale_product_list.dart';

import '../controllers/sale_controller.dart';

class SaleView extends GetView<SaleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的挂售'),
        centerTitle: true,
      ),
      body: Container(
        child: SaleProductListView(),
      )
    );
  }
}
