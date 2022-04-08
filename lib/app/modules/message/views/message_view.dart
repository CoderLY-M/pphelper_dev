import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(

        ),
      )
    );
  }
}
