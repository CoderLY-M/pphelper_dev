import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/product_detail/views/product_detail_bottom/product_detail_bottom.dart';
import 'package:pphelper/app/modules/product_detail/views/product_detail_expain/product_detail_expain.dart';
import 'package:pphelper/app/modules/product_detail/views/product_detail_tabber/product_detail_tabber.dart';
import '../controllers/product_detail_controller.dart';
import '../models/product_detail_model.dart';

/**
 * 商品项视图
 */

class ProductDetailView extends StatelessWidget {
  final ProductDetailController productDetailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<ProductDetailController>(
          builder: (controller) {
            ProductDetailModel productItem = productDetailController.productModel;
            if(productDetailController.isLoading){
              return Scaffold(
                appBar: AppBar(title: Text(""),),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else{
              return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_sharp),
                      onPressed: () {
                        //返回
                        Navigator.pop(context);
                      },
                    ),
                    title: Text(productItem.productName.toString(),),
                    centerTitle: true,
                  ),
                  body: Container(
                      child: Stack(
                        children: [
                          ListView(
                            children: [
                              _productImageView(productItem),
                              _productBasicView(productItem),
                              ProductDetailExpainView(),
                              ProductDetailTabberView(),
                            ],
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              //底部购物车栏目
                            child: ProductDetailBottomBarView()
                          )
                        ],
                      )
                  )
              );
            }
          },
        )
    );
  }

  //商品图片
  Widget _productImageView(item) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            child: ImageWidget(url: item.imageUrl[index],)
          );
        },
        itemCount: item.imageUrl.length,
        scale: 0.7,
        pagination: new SwiperPagination(),
        autoplay: false,
        controller: new SwiperController(),
      ),
    );
  }

  //商品基本信息
  Widget _productBasicView(item) {
    return Container(
        height: ScreenUtil().setHeight(227),
        width: ScreenUtil().screenWidth,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            //商品名称
            Container(
              child: Text(
                item.productName,
                maxLines: 1,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
            //商品编号
            Container(
              margin: EdgeInsets.only(top:8.0),
              child: Text(
                '编号:${item.id}',
                style: TextStyle(
                    color: Colors.black26
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "￥${item.productPrice}",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w300,
                        color: Colors.red
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "数量:${item.productCount}",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        color: Colors.grey
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                item.productDesc,
                textAlign: TextAlign.left,
              ),
            )
          ],
        )
    );
  }
}
