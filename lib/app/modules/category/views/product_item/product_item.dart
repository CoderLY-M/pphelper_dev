import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/category/models/category_product_model.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';

import '../../../../routes/app_pages.dart';

/**
 * 商品项
 */
class ProductItem extends StatelessWidget {
  final CategoryProductModel item;
  const ProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:() {
          Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": item.id});
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width:0.5,color:Colors.black12),
              left: BorderSide(width:0.5,color:Colors.black12),
              right: BorderSide(width:0.5,color:Colors.black12),
              bottom: BorderSide(width:0.5,color:Colors.black12),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              _productImage(item),
              _productName(item),
              _productPrice(item),
              _productViewCount(item),
            ],
          ),
        ),
      ),
    );
  }

  //商品图片
  Widget _productImage(item) {
    if(item.imageUrl.length != 0){
      return Container(
        child: ImageWidget(url: item.imageUrl[0],)
      );
    }else{
      return Container(
        child: Image.asset("assets/1.0x/images/empty.png")
      );
    }
  }

  //商品名称
  Widget _productName(item) {
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 5),
      child: Text(
        "${item.productName}",
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            height: ScreenUtil().setHeight(2)
        ),
      ),
    );
  }

  //商品价格
  Widget _productPrice(item) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "￥${item.productPrice}",
            style: TextStyle(
                color: Colors.red,
                fontSize: ScreenUtil().setSp(25),
                height: ScreenUtil().setHeight(1.5)
            ),
          ),
        ],
      ),
    );
  }

  //商品浏览量
  Widget _productViewCount(item) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Opacity(
            opacity: 0.5,
            child: Text("浏览量:${item.viewCount}",style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              height: ScreenUtil().setHeight(3),
            ),),
          )
        ],
      ),
    );
  }
}
