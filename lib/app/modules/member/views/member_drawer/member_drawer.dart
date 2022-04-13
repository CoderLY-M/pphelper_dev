import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/member/controllers/member_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';

/**
 * 用户资料
 */
class MemberDrawerView extends StatelessWidget {
  const MemberDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MemberController>(
        builder: (controller) {
          var loginMember = controller.loginMember;
          return Container(
              color: Colors.white,
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth - 200,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text("${loginMember.nickName}"),
                    accountEmail: Text("${loginMember.email}"),
                    onDetailsPressed: (){},
                    currentAccountPicture: ClipOval(
                      child: ImageWidget(url: loginMember.avatar,),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/1.0x/images/header_back.png")
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.MEMBER_PERSON_CENTER);
                    },
                    child: ListTile(
                      title: Text("个人中心"),
                      leading: CircleAvatar(
                          child: Icon(Icons.person)
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //跳转到我的钱包
                      Get.toNamed(Routes.WALLET);
                    },
                    child: ListTile(
                      title: Text("我的钱包"),
                      leading: CircleAvatar(
                          child: Icon(Icons.account_balance_wallet_rounded)
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  ListTile(
                    title: Text("系统信息"),
                    leading: CircleAvatar(
                        child: Icon(Icons.settings_rounded)
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        _logOut(context);
                      },
                      child: Text("退出登录"),
                    ),
                  )
                ],
              )
          );
        }
    );
  }

  //退出登录
  _logOut(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(children: [Icon(Icons.logout),],),
          content: Text('确定退出登录？'),
          actions: <Widget>[
            ElevatedButton(child: Text('取消'),onPressed: (){
              Navigator.of(context).pop();
            }, style: ElevatedButton.styleFrom(primary: Colors.red),),
            ElevatedButton(child: Text('确认'),onPressed: (){
              Get.find<MemberController>().logOutMember();
              Navigator.of(context).pop();
              Navigator.of(context).pop();  //隐藏侧边栏
            },),
          ],
        );
    });
  }
}
