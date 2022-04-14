import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/controllers/bus_item_controller.dart';
import 'package:pphelper/app/modules/bus/models/bus_product_model.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/bus_controller.dart';
import '../bus_count/bus_count.dart';

/**
 * 购物车商品单列
 */

class BusItemView extends StatelessWidget {
  final BusProductModel busModel;
  BusItemView({Key? key, required this.busModel}) : super(key: key);

  final BusItemController busItemController = Get.put(BusItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0,2.0,10.0,2.0),
      padding: EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
      width: ScreenUtil().screenWidth - 20,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width:1,color:Colors.black12)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              _checkButtons(),
              _busImage(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _busProductName(),
                  _busPrice(),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  _removeBus(),
                  BusCountView(busModel: busModel),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  //多选按钮
  Widget _checkButtons() {
    return Container(
      child: Checkbox(
        value: busModel.isCheck,
        activeColor: Colors.red,
        onChanged: (val) {
          Get.find<BusController>().handleOneChecked(busModel.id, val);
        } ,
      ),
    );
  }

  //展示商品图片
  Widget _busImage(){
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": busModel.id});
      },
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(100),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1,color:Colors.black12)
        ),
        child: ImageWidget(url: busModel.imageUrl!,)
      ),
    );
  }

  //商品名称
  Widget _busProductName(){
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": busModel.id});
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(busModel.productName ?? "")
          ],
        ),
      ),
    );
  }

  //商品价格
  Widget _busPrice(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text("￥"),
              Text(
                busModel.productPrice.toString(),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: ScreenUtil().setSp(30)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //移除商品
  Widget _removeBus() {
    return Container(
      height: ScreenUtil().setHeight(30),
      margin: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          Get.find<BusController>().removeBusProduct(busModel.id);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black45
        ),
        child: Text("移除"),
      )
    );
  }

}

