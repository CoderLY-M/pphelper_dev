import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/routes/app_pages.dart';

import '../../../../utils/member_limit.dart';


class MemberListView extends StatelessWidget {
  const MemberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
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
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("订单总数"),
                ),
                VerticalDivider(),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("收藏总数"),
                ),
                VerticalDivider(),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("挂售商品"),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Expanded(
              child: Row(
                children: [
                  IconText(icon: Icons.favorite_border,text: "我的收藏",color: Colors.blue, index: 0,),
                  IconText(icon: Icons.shopping_bag_outlined,text: "我的挂售",color: Colors.blue, index: 1,),
                  IconText(icon: Icons.shopping_basket_outlined,text: "上架商品",color: Colors.blue, index: 2,),
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
  const IconText({Key? key, required this.icon, required this.text, required this.color, required this.index}) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MemberLimit.limitNoLoginMember().then((cassPass){
          if(cassPass) {
            goToView(index);
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

  //跳转页面
  goToView(int index) {
    switch (index) {
      case 0: {
        //跳转到我的收藏
        Get.toNamed(Routes.COLLECTION);
      }
      break;
      case 1: {
        //跳转到我的挂售
        Get.toNamed(Routes.SALE);
      }
      break;
      case 2: {
        //跳转到上架商品
        Get.toNamed(Routes.NEW_STOCK);
      }
      break;
    }
  }
}
