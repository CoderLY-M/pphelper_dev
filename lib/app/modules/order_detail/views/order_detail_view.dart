import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/order_detail/views/order_detail_item/order_detail_item.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  OrderDetailController orderDetailController = Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
        centerTitle: true,
      ),
      body: GetBuilder<OrderDetailController>(
        builder: (controller) {
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            var orderDetail = controller.orderDetail;
            return ListView(
              children: [
                OrderDetailHeaderView(),
                OrderDetailContentView(),
                OrderDetailFooterView(),
              ],
            );
          }
        },
      )
    );
  }
}


//头部
class OrderDetailHeaderView extends StatelessWidget {
  const OrderDetailHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
        builder: (controller) {
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
                      child: Text("${controller.currentMember.nickName}",style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          height: 1.5,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("${controller.currentMember.phone}", style: TextStyle(
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
    return GetBuilder<OrderDetailController>(
        builder: (controller) {
          var orderDetail = controller.orderDetail;
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
                    title: Text("${orderDetail.id}"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("卖家名称:"),
                    title: Text("${orderDetail.sellerName}"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("联系方式:"),
                    title: Text("${orderDetail.phone}"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("下单时间:"),
                    title: Text("${orderDetail.time}"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("支付方式:"),
                    title: _payTypeView(orderDetail),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("支付时间:"),
                    title: Text("${orderDetail.time}"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("商品数量:"),
                    trailing: Text("${orderDetail.buyCount}件"),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: Text("商品总价:"),
                    trailing: Text("￥${orderDetail.totalPrice}"),
                  ),
                ],
              )
          );
        }
    );
  }

  //付款方式
  Widget _payTypeView(var type) {
    if(type == 1) {
      //支付宝
      return Text("支付宝");
    }else if(type == 2) {
      //微信
      return Text("微信");
    }else {
      //我的钱包
      return Text("我的钱包");
    }
  }
}


