import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/controllers/bus_controller.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';

/**
 * 购物车商品的增加与减少
 */

class BusCountView extends StatelessWidget {
  const BusCountView({Key? key, required this.busModel}) : super(key: key);
  final BusProductModel busModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border:Border.all(width: 1 , color:Colors.black12)
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(),
          _countArea(),
          _addBtn(),
        ],
      ),
    );
  }

  // 减少按钮
  Widget _reduceBtn(){
    return InkWell(
      onTap: () {
        Get.find<BusController>().decrementBusProduct(busModel.id);
      },
      child: Container(
        width: ScreenUtil().setWidth(40),
        height: ScreenUtil().setHeight(30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(
                right:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('-'),
      ),
    );
  }

  //添加按钮
  Widget _addBtn(){
    return InkWell(
      onTap: (){
        Get.find<BusController>().addBusProduct(busModel);
      },
      child: Container(
        width: ScreenUtil().setWidth(40),
        height: ScreenUtil().setHeight(30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(
                left:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea(){
    return Container(
      width: ScreenUtil().setWidth(30),
      height: ScreenUtil().setHeight(30),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(busModel.count.toString()),
    );
  }
}