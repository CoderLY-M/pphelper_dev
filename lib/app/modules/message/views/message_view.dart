import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/message/views/message_chart_list/message_chart_list.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
        centerTitle: true,
      ),
      body: GetBuilder<MessageController>(
        builder: (controller) {
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Container(
              child: MessageChartList(),
            );
          }
        },
      )
    );
  }
}
