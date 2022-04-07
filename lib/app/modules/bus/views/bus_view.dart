import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bus_controller.dart';
import 'bus_bottom/bus_bottom.dart';
import 'bus_item/bus_item.dart';

class BusView extends GetView<BusController> {
  final BusController busController = Get.put(BusController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<BusController>(
          builder: (controller) {
            return Scaffold(
                appBar: AppBar(title: Text("购物车"),centerTitle: true,),
                body: Stack(
                  children: [
                    ListView.builder(
                        itemCount: busController.dataProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BusItemView(busModel: busController.dataProducts[index]);
                        }
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        //底部购物车栏目
                        child: BusBottomView()
                    )
                  ],
                )
            );
          },
        )
    );
  }
}
