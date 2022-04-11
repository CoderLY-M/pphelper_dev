import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/chart/views/chart_bottom/chart_bottom.dart';

import '../controllers/chart_controller.dart';
import 'chat_list/chart_list.dart';

class ChartView extends GetView<ChartController> {
  ChartController chartController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天记录(${Get.arguments["another"].nickName})'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*8/10,
                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: ChartList(),
                )
            ),
            ChartBottom()
          ],
        ),
      )
    );
  }
}
