import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/order_detail/controllers/order_detail_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';


class OrderDetailItemView extends StatelessWidget {
  const OrderDetailItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
        builder: (controller) {
          var orderDetail = controller.orderDetail;
          return Container(
              child: Column(
                children: [
                  _orderItemTop(context, orderDetail),
                  _orderItemBody(context, orderDetail),
                  _orederItemBottom(context, orderDetail),
                ],
              )
          );
        }
    );
  }

  //顶部
  Widget _orderItemTop(context, orderDetail) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${orderDetail.productName}", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          // _statuesView(),
        ],
      ),
    );
  }

  //主体
  Widget _orderItemBody(context, orderDetail) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //图片
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.ORDER_DETAIL);
                },
                child: Container(
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().screenWidth / 4,
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: ImageWidget(url: "${orderDetail.productImage}",)
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              //描述
              Container(
                width: ScreenUtil().setWidth(400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${orderDetail.productDesc}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("数量:${orderDetail.productCount}", overflow: TextOverflow.ellipsis, style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),),
                        SizedBox(width: 20,),
                        //金额
                        Text("￥${orderDetail.productPrice}", style: TextStyle(
                            color: Colors.blue
                        ),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //底部
  Widget _orederItemBottom(context, orderDetail) {
    return Container(
      height: ScreenUtil().setHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey))
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: FlatButton(
                      onPressed: () {

                      },child: Text("退换/售后"),
                    )
                ),
                SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey))
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: FlatButton(
                    onPressed: () {

                    },child: Text("再次购买"),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget _statuesView() {
  //   if(item.status == 1) {
  //     return Container(
  //       child: Text("已支付",style: TextStyle(
  //           color: Colors.black54
  //       ),),
  //     );
  //   }else if(item.status == 2) {
  //     return Container(
  //       child: Text("待发货",style: TextStyle(
  //           color: Colors.black54
  //       ),),
  //     );
  //   }else if(item.status == 3) {
  //     return Container(
  //       child: Text("待收货",style: TextStyle(
  //           color: Colors.black54
  //       ),),
  //     );
  //   }else{
  //     return Container(
  //       child: Text("待评价",style: TextStyle(
  //           color: Colors.black54
  //       ),),
  //     );
  //   }
  // }
}