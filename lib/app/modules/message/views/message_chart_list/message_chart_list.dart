import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/message/controllers/message_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';

import '../../../product_detail/models/sale_memeber_model.dart';

class MessageChartList extends StatelessWidget {
  const MessageChartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
        builder: (controller) {
          //获取列表数据
          var chartMemberList = controller.chartMemberList;
          return Container(
            margin: EdgeInsets.only(top: 10 ),
            decoration: BoxDecoration(
                border: new Border.all(color: Colors.black12, width: 1)
            ),
            child: ListView.builder(
              itemCount: chartMemberList.length,
              itemBuilder: (BuildContext context, int index) {
                return ChartMemberItemView(item: chartMemberList[index],);
              }
            )
          );
        }
    );
  }
}

/**
 * 单条消息
 */
class ChartMemberItemView extends StatelessWidget {
  final item;
  const ChartMemberItemView({Key? key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        SaleMemberModel saleMemberModel = new SaleMemberModel(id: item.anotherId, nickName: item.nickName);
        Get.toNamed(Routes.CHART, arguments: {"another": saleMemberModel});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: ListTile(
          title: Text("${item.nickName}", style: TextStyle(color: Colors.blue),),
          subtitle: Container(
            alignment: Alignment.bottomLeft,
            height: 25,
            padding: EdgeInsets.only(right: 10),
            child: Text("${item.message}", overflow: TextOverflow.ellipsis,),
          ),
          leading: Container(
            width: 45, height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage("assets/1.0x/images/empty.png"))
            ),
          ),
          trailing: Text("${item.time}", style: TextStyle(color: Colors.blue),),
        ),
      ),
    );
  }
}

