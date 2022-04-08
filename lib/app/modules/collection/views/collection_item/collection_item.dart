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
class CollectionItemView extends StatelessWidget {
  final collectionProduct;

  const CollectionItemView({Key? key, this.collectionProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
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
          Text("${collectionProduct.productName}", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
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
                child: ImageWidget(url: collectionProduct.imageUrl,)
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
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
                Text("￥${collectionProduct.productPrice}", style: TextStyle(
                    color: Colors.red
                ),),
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
