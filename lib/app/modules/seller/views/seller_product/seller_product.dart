import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:pphelper/app/modules/seller/controllers/seller_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../common/image_widget/image_widget.dart';


/**
 * 挂售商品列表
 */
class SellerProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<SellerController>(
        //获取列表数据
          builder: (controller) {
            return Container(
              child: ListView.builder(
                itemCount: controller.sellerProducts.length,
                itemBuilder: (builder, index) {
                  return SellerProductItemView(saleProduct: controller.sellerProducts[index],);
                }
              )
            );
          }
      ),
    );
  }
}


/**
 * 单个挂售商品
 */
class SellerProductItemView extends StatelessWidget {
  final saleProduct;
  const SellerProductItemView({Key? key, this.saleProduct}) : super(key: key);

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
          InkWell(
            onTap: () {
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": saleProduct.id});
              Get.find<ProductDetailController>().onInit();
            },
            child: Text("${saleProduct.productName}", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
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
          InkWell(
            onTap: (){
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": saleProduct.id});
              Get.find<ProductDetailController>().onInit();
            },
            //图片
            child: Container(
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
          )
          ,
          //描述
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
            ),
            child: Text(
              "${saleProduct.productDesc}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
                Text("￥${saleProduct.productPrice}", style: TextStyle(
                    color: Colors.red
                ),),
                Divider(height: 20,),
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
              Get.find<ProductDetailController>().onInit();
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: _productStatus(),
          )
        ],
      ),
    );
  }
}