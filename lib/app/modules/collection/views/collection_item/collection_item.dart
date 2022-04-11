import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/collection/controllers/collection_controller.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
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
          //描述
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
            ),
            child: Text(
              "${collectionProduct.productDesc}",
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
              Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": collectionProduct.id});
            },
            child: Icon(Icons.more_horiz),
          ),
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    //取消收藏
                    canCelCollection(context);
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red,),
                          Text("取消收藏", style: TextStyle(color: Colors.red),)
                        ],
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  //取消收藏
  canCelCollection(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Text("确定取消收藏"),
              Text("${collectionProduct.productName}", style: TextStyle(color: Colors.red),),
              Text("这件商品？"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(child: Text('取消'),onPressed: (){
              Navigator.of(context).pop();
            }, style: ElevatedButton.styleFrom(primary: Colors.red),),
            ElevatedButton(child: Text('确认'),onPressed: () async{
              try{
                //取消收藏成功
                await Get.find<CollectionController>().removeBusProduct(collectionProduct.id);
                Fluttertoast.showToast(
                    msg: "移除收藏成功",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }catch(e) {
                //取消收藏失败
                Fluttertoast.showToast(
                    msg: "移除收藏失败",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              Navigator.of(context).pop();
            },),
          ],
        );
    });
  }
}
