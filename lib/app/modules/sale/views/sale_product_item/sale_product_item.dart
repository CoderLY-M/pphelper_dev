import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

/**
 * 挂售商品
 */
class SaleProductItemView extends StatelessWidget {
  const SaleProductItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10,right: 10, top: 10),
        // height: ScreenUtil().setHeight(200),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
            child: Column(
              children: [
                _orderItemTop(context),
                _orderItemBody(context),
                _orederItemBottom(context),
              ],
            )
        )
    );
  }

  //顶部
  Widget _orderItemTop(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("苹果11", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          Container(
            child: Text("已完成",style: TextStyle(
                color: Colors.black54
            ),),
          )
        ],
      ),
    );
  }

  //主体
  Widget _orderItemBody(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //图片
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(180),
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset("assets/1.0x/images/empty.png", fit: BoxFit.cover,),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          //描述
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
            ),
            child: Text(
              "Google 的 Flutter 越来越火，截止 2021年07月25日 GitHub 标星已达 125K，Flutter 毅然是一种趋势，所以作为前端开发者，没有理由不趁早去学习。" +
                  "如果你是 Flutter 新手或者刚入门，不妨先点个关注，后续我会将 Flutter 中的常用组件（含有源码分析、组件的用法及注意事项）以及可能遇到的问题写到 CSDN 博客中，希望自己学习的同时，也可以帮助更多的人。",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          //金额
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
            ),
            child: Column(
              children: [
                //金额
                Text("${"￥100.00"}", style: TextStyle(
                    color: Colors.red
                ),),
                //数量
                Text("共1件", style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }

  //底部
  Widget _orederItemBottom(context) {
    return Container(
      height: ScreenUtil().setHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              //跳转到挂售商品详情页
              Get.toNamed(Routes.ORDER_DETAIL);
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: () {}, child: Text("下架商品"),style: ElevatedButton.styleFrom(primary: Colors.red)
                  ),),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: () {}, child: Text("修改商品"),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
