import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/member_limit.dart';
import '../../controllers/product_detail_controller.dart';

class ProductDetailBottomBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        builder: (controller) {
          var isCollection = controller.isCollection;
          return Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                    color: Colors.black45
                )]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          //跳转到购物车
                          MemberLimit.limitNoLoginMember().then((cassAdd){
                            if(cassAdd) {
                              Get.toNamed(Routes.BUS);
                            }else{
                              Get.toNamed(Routes.LOGIN);
                            }
                          });
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(110) ,
                          // alignment: Alignment.bottomCenter,
                          child:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "购物车",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(15)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          MemberLimit.limitNoLoginMember().then((cassAdd){
                            if(cassAdd) {
                              Get.find<ProductDetailController>().updateIsCollection();
                            }else{
                              Get.toNamed(Routes.LOGIN);
                            }
                          });
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(50) ,
                          // alignment: Alignment.bottomCenter,
                          child:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isCollection ? Icons.favorite : Icons.favorite_border,
                                  size: 35,
                                  color: Colors.red,
                                ),
                                Text(
                                  "收藏",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(15)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                              //添加商品到购物车
                              MemberLimit.limitNoLoginMember().then((cassAdd){
                                if(cassAdd) {
                                  Get.find<ProductDetailController>().addProductToBus();
                                }else{
                                  Get.toNamed(Routes.LOGIN);
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            color: Colors.blue,
                            child: Text(
                              "加入购物车",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: MaterialButton(
                            onPressed: () {
                              MemberLimit.limitNoLoginMember().then((cassAdd){
                                if(cassAdd) {

                                }else{
                                  Get.toNamed(Routes.LOGIN);
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            color: Colors.red,
                            child: Text(
                              "立即购买",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          );
        }
    );
  }
}