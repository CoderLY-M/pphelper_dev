import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/system_info_controller.dart';

class SystemInfoView extends GetView<SystemInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SystemInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SystemInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
