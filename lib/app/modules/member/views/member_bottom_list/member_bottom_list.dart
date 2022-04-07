import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/member_limit.dart';


class MemberBottomListView extends StatelessWidget {
  const MemberBottomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: _actionList()
    );
  }

  Widget _ListTile(String title, IconData icon){
    return InkWell(
      onTap: () {
        if(title == "地址管理") {
          MemberLimit.limitNoLoginMember().then((cassPass){
            if(cassPass) {
            }else{
              Get.toNamed(Routes.LOGIN);
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom:BorderSide(width: 1,color:Colors.black12)
            )
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }

  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _ListTile('地址管理', Icons.add_location_alt_outlined),
          _ListTile('客服电话', Icons.phone),
          _ListTile('关于我们', Icons.email),
        ],
      ),
    );
  }
}


