import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/sale/controllers/sale_controller.dart';

import '../../../../routes/app_pages.dart';

/**
 * 挂售商品
 */
class SaleProductItemView extends StatelessWidget {
  final saleProduct;
  const SaleProductItemView({Key? key, this.saleProduct}) : super(key: key);

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
          Text("${saleProduct.productName}", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          Container(
            child: _productStatus()
          )
        ],
      ),
    );
  }

  //商品状态组件
  Widget? _productStatus() {
    if(saleProduct.status == 0) {
      return Text("已下架",style: TextStyle(
          color: Colors.red
      ),);
    }else if(saleProduct.status == 1) {
      return Text("在售",style: TextStyle(
          color: Colors.blue
      ),);
    }else if(saleProduct.status == 2) {
      return Text("待审核",style: TextStyle(
          color: Colors.yellow
      ),);
    }
  }

  //主体
  Widget _orderItemBody(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //图片
              Container(
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setWidth(180),
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ImageWidget(url: saleProduct.imageUrl[0],)
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              //描述
              Container(
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setWidth(300),
                decoration: BoxDecoration(
                ),
                child: Text(
                  "${saleProduct.productDesc}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          //金额
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
            ),
            child: Column(
              children: [
                //金额
                Text("￥${saleProduct.productPrice}", style: TextStyle(
                    color: Colors.red
                ),),
                //数量
                Text("共${saleProduct.productCount}件", style: TextStyle(
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
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": saleProduct.id});
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: Row(
              children: [
                _btnSoldOutShowWidget(context),
                _btnSoldUpShowWidget(context),
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

  //下架商品按键的显示
  Widget _btnSoldOutShowWidget(context) {
    if(saleProduct.status == 1) {
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: ElevatedButton(onPressed: () {
          _handleSoldOut(context);
        }, child: Text("下架商品"),style: ElevatedButton.styleFrom(primary: Colors.red)
      ));
    }else{
      return Container(

      );
    }
  }

  //上架商品按键的显示
  Widget _btnSoldUpShowWidget(context) {
    if(saleProduct.status == 0) {
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: ElevatedButton(onPressed: () {
          _handleSoldUp(context);
        }, child: Text("上架商品"),style: ElevatedButton.styleFrom(primary: Colors.blue)
        ));
    }else{
      return Container(

      );
    }
  }

  //下架商品操作
  _handleSoldOut(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Text("确定下架"),
              Text("${saleProduct.productName}", style: TextStyle(color: Colors.red),),
              Text("这件商品？"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(child: Text('取消'),onPressed: (){
              Navigator.of(context).pop();
            }, style: ElevatedButton.styleFrom(primary: Colors.red),),
            ElevatedButton(child: Text('确认'),onPressed: () async{
              await Get.find<SaleController>().soldOutProduct(saleProduct.id);
              Navigator.of(context).pop();
            },),
          ],
        );
    });
  }

  //上架商品操作
  _handleSoldUp(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("上架商品"),
            content: Row(
              children: [
                Text("确定上架"),
                Text("${saleProduct.productName}", style: TextStyle(color: Colors.red),),
                Text("这件商品？"),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(child: Text('取消'),onPressed: (){
                Navigator.of(context).pop();
              }, style: ElevatedButton.styleFrom(primary: Colors.red),),
              ElevatedButton(child: Text('确认'),onPressed: () async{
                await Get.find<SaleController>().soldUpProduct(saleProduct.id);
                Navigator.of(context).pop();
              },),
            ],
          );
        });
  }
}
