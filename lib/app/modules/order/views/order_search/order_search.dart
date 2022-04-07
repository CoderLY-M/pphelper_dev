import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 搜索栏
 */

class OrderSearchView extends StatelessWidget {
  const OrderSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(60),
      margin: EdgeInsets.only(left: 20),
      width: ScreenUtil().setWidth(500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5),
          color: Colors.white
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "搜索订单....",
          prefixIcon: Icon(Icons.search, color: Colors.blue,)
        ),
      ),
    );
  }
}
