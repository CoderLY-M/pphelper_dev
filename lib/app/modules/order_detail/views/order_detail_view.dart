import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/order_detail/views/order_detail_item/order_detail_item.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          OrderDetailHeaderView(),
          OrderDetailContentView(),
          OrderDetailFooterView(),
        ],
      )
    );
  }
}


//头部
class OrderDetailHeaderView extends StatelessWidget {
  const OrderDetailHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_location,color: Colors.blue,size: ScreenUtil().setSp(30),),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text("小妮",style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  height: 1.5,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("181237834738", style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  height: 1.5,
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text("地址:武汉市武昌区")
              ],
            ),
          )
        ],
      ),
    );
  }
}


//主体内容
class OrderDetailContentView extends StatelessWidget {
  const OrderDetailContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: OrderDetailItemView()
    );
  }
}

//底部
class OrderDetailFooterView extends StatelessWidget {
  const OrderDetailFooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            ListTile(
              leading: Text("订单编号:"),
              title: Text("223243434343"),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Text("下单时间:"),
              title: Text("2022-09-11 12:22:09"),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Text("支付方式:"),
              title: Text("我的钱包"),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Text("支付时间:"),
              title: Text("2022-09-11 12:22:09"),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Text("商品数量:"),
              trailing: Text("2件"),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Text("商品总价:"),
              trailing: Text("￥2340.00"),
            ),
          ],
        )
    );
  }
}


