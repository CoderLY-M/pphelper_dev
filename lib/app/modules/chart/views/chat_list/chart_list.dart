import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble/issue_clipper.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/chart/controllers/chart_controller.dart';


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
                return ChatRowView(avatarLocalSavedPath: "assets/1.0x/images/empty.png", item: controller.messageList[index], isMyself: item.owner == 1 ? true : false,);
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
  String avatarLocalSavedPath;
  var item;
  bool isMyself;

  ChatRowView({required this.avatarLocalSavedPath,
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
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("${time}"),
            ),
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
                  child: Text("${item.message}")
              ),
            ),
            SizedBox(
                height: 50,
                child: Image.asset(this.avatarLocalSavedPath)
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
            SizedBox(
                height: 50,
                child: Image.asset("assets/1.0x/images/empty.png")
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
                  child: Text("${item.message}")
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("${time}"),
            )
          ],
        ),
      );
    }
  }
}
