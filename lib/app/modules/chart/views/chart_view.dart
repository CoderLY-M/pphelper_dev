import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
