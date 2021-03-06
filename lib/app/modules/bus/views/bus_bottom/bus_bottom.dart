import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';
import 'package:pphelper/app/modules/settlement/models/settle_select.dart';

import '../../../../routes/app_pages.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectAllBtn(),
                Container(
                  child: Row(
                    children: [
                      allPriceArea(totalPrice),
                      goButton(context, length)
                    ],
                  ),
                )
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
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text(
                '合计:',
                style:TextStyle(
                    fontSize: ScreenUtil().setSp(25)
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
    );
  }

  //结算按钮
  Widget goButton(context,length){
    return GetBuilder<BusController>(
        builder:(controller) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child:InkWell(
              onTap: () async{
                var dataProducts = await Get.find<BusController>().getCheckedShops();
                if(dataProducts.length != 0) {
                  //勾选商品
                  List<SettleSelectModel> productList = [];
                  dataProducts.forEach((element) {
                    var settleSelectModel = new SettleSelectModel(id: element.id, count: element.count);
                    productList.add(settleSelectModel);
                  });
                  Get.toNamed(Routes.SETTLEMENT, arguments: {"products": productList});
                }else{
                  Fluttertoast.showToast(
                      msg: "没有选择结算的商品哦~~~~",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.red,
                      fontSize: 16.0
                  );
                }
              },
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