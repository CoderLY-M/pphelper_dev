import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import 'package:pphelper/app/utils/member_limit.dart';


class MemberStatusView extends StatelessWidget {
  const MemberStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(240),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text("商品详情"),
          ),
          Divider(
            height: 1.0,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconText(icon: Icons.list,text: "全部",color: Colors.blue, routeVal: 0,),
                IconText(icon: Icons.party_mode,text: "已支付",color: Colors.blue,routeVal: 1,),
                IconText(icon: Icons.query_builder,text: "代发货",color: Colors.blue,routeVal: 2,),
                IconText(icon: Icons.directions_car,text: "代收货",color: Colors.blue,routeVal: 3,),
                IconText(icon: Icons.content_paste,text: "待评价",color: Colors.blue,routeVal: 4,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/**
 * 图标
 */
class IconText extends StatelessWidget {
  const IconText({Key? key, required this.icon, required this.text, required this.color, required this.routeVal}) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final int routeVal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //跳转到订单页面
        MemberLimit.limitNoLoginMember().then((cassPass){
          if(cassPass) {
            Get.toNamed(Routes.ORDER,arguments: {"tabberIndex": routeVal});
          }else{
            Get.toNamed(Routes.LOGIN);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Icon(icon, color: color,),
            Text(text)
          ],
        ),

      ),
    );
  }
}
