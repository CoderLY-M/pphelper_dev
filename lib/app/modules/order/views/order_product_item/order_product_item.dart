import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/routes/app_pages.dart';
/**
 * 单个订单
 */
class OrderProductItemView extends StatelessWidget {
  final item;
  const OrderProductItemView({Key? key, this.item}) : super(key: key);

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
          Text("${item.productTitle}", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          _statuesView(),
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
          InkWell(
            onTap: () {
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": item.productId});
            },
            child: Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(180),
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ImageWidget(url: item.productCover,)
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          //描述
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
            ),
            child: Column(
              children: [
                Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      "订单编号:${item.id}",
                    )
                ),
                SizedBox(height: 10,),
                Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      "卖家:${item.sellerName}",
                    )
                ),
              ],
            )
          ),
          //金额
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
            ),
            child: Column(
              children: [
                //金额
                Text("${"￥${item.totalFee}"}", style: TextStyle(
                  color: Colors.red
                ),),
                //数量
                Text("共${item.productCount}件", style: TextStyle(
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
              //跳转到订单详情页
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": item.productId});
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: () {}, child: Text("退换/售后"),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(onPressed: () {
                    Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": item.productId});
                  }, child: Text("再次购买"),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _statuesView() {
    if(item.status == 1) {
      return Container(
        child: Text("已支付",style: TextStyle(
            color: Colors.black54
        ),),
      );
    }else if(item.status == 2) {
      return Container(
        child: Text("待发货",style: TextStyle(
            color: Colors.black54
        ),),
      );
    }else if(item.status == 3) {
      return Container(
        child: Text("待收货",style: TextStyle(
            color: Colors.black54
        ),),
      );
    }else{
      return Container(
        child: Text("待评价",style: TextStyle(
            color: Colors.black54
        ),),
      );
    }
  }
}
