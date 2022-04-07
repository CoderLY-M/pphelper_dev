import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailExpainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.add_location_outlined, color: Colors.red,),
          Text(
            "发货地址:",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Text(
            "湖北省",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.red,size: ScreenUtil().setSp(20),),
          Text(
            "武昌区",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.red,size: ScreenUtil().setSp(20),),
          Text(
            "武汉市",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
        ],
      ),
    );
  }
}
