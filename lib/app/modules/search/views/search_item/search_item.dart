import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pphelper/app/modules/search/models/search_product_model.dart';
/**
 * 单个订单
 */
class SearchItemView extends StatelessWidget {
  final SearchProductModel searchProductModel;
  const SearchItemView({Key? key, required this.searchProductModel}) : super(key: key);

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
          Text("${searchProductModel.productName}", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          Container(
            child: Text("浏览量:${searchProductModel.viewCount}",style: TextStyle(
                color: Colors.black54
            ),),
          )
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
              child: Image.asset("assets/1.0x/images/empty.png", fit: BoxFit.cover,),
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
            child: Text("${searchProductModel.productDesc}")
          ),
          //金额
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
            ),
            child: Column(
              children: [
                //金额
                Text("${searchProductModel.productDesc}", style: TextStyle(
                    color: Colors.red
                ),),
                //数量
                Text("共${searchProductModel.buyCount}件", style: TextStyle(
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
}
