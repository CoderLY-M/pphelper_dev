import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble/issue_clipper.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/chart/controllers/chart_controller.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';

import '../../../../routes/app_pages.dart';


class ChartList extends StatelessWidget {
  const ChartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: GetBuilder<ChartController>(
        builder: (controller) {
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(
              itemCount: controller.messageList.length,
              itemBuilder: (context, index) {
                var item = controller.messageList[index];
                return ChatRowView(item: controller.messageList[index], isMyself: item.owner == 1 ? true : false,);
              }
            );
          }
        },
      )

    );
  }
}


/**
 * 聊天单行
 */
class ChatRowView extends StatelessWidget{
  var item;
  bool isMyself;

  ChatRowView({
    required this.item,
    required this.isMyself});

  @override
  Widget build(BuildContext context) {
    var splitList = DateTime.parse(item.time).toLocal().toString().split(".");
    var time = splitList[0];
    if(isMyself) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              elevation: 10,
              color: Color.fromRGBO(225, 255, 199, 1.0),
              padding: BubbleEdges.all(10),
              nip: BubbleNip.rightTop,
              child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width/2
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${item.message}"),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.access_time_sharp, size: 15, color: Colors.black12,),
                          Text("${time}", style: TextStyle(
                              color: Colors.black12
                          ),)
                        ],
                      )
                    ],
                  )
              ),
            ),
            SizedBox(
                height: 40,
                child: GetBuilder<ChartController>(
                  builder: (controller) {
                    return ImageWidget(url: controller.currentMember.avatar,);
                  },
                )
            ),
          ],
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GetBuilder<ChartController>(
              builder: (controller) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SELLER, arguments: {"memberId": controller.anotherMember.id});
                  },
                  child: SizedBox(
                      height: 40,
                      child: ImageWidget(url: controller.anotherMember.avatar,)
                  ),
                );
              },
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              nip: BubbleNip.leftTop,
              elevation: 10,
              padding: BubbleEdges.all(10),
              child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width/2
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item.message}"),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.access_time_sharp, size: 15, color: Colors.black12,),
                          Text("${time}", style: TextStyle(
                            color: Colors.black12
                          ),)
                        ],
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
      );
    }
  }
}
