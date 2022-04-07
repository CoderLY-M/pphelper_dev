import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';

import '../../controllers/bus_controller.dart';

/**
 * 购物车底部栏
 */

class BusBottomView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusController>(
        builder: (controller) {
          //获取价格
          double totalPrice = controller.totalPrice;
          List<BusProductModel> busProducts = controller.dataProducts;
          var length = busProducts.length;
          return Container(
            // margin: EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight / 20,
            child: Row(
              children: [
                selectAllBtn(),
                allPriceArea(totalPrice),
                goButton(length)
              ],
            ),
          );
        }
    );
  }

  //全选按钮
  Widget selectAllBtn(){
    return GetBuilder<BusController>(
        builder: (controller) {
          return Container(
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: controller.allChecked,
                  activeColor: Colors.red,
                  onChanged: (val){
                    controller.handleAllChecked(val!);
                  },
                ),
                Text('全选')
              ],
            ),
          );
        }
    );
  }

  // 合计区域
  Widget allPriceArea(totalPrice){
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                    '合计:',
                    style:TextStyle(
                        fontSize: ScreenUtil().setSp(20)
                    )
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                    '￥${totalPrice}',
                    style:TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      color: Colors.red,
                    )
                ),

              )
            ],
          ),
        ],
      ),
    );
  }

  //结算按钮
  Widget goButton(length){
    return GetBuilder<BusController>(
        builder:(controller) {
          return Container(
            width: ScreenUtil().setWidth(160),
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.all(5),
            child:InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Text(
                  '结算(${controller.checkedCount})',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ) ,
          );
        }
    );
  }
}