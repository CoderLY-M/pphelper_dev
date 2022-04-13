import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/member/controllers/member_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';

/**
 * 个人中心头部区域
 */

class MemberTopView extends StatelessWidget {
  final MemberController memberController = Get.find<MemberController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenUtil().setHeight(500),
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/1.0x/images/header_back.png")
            )
          ),
          child: GetBuilder<MemberController>(
            builder: (controller) {
              var loginMember = memberController.loginMember;
              if(loginMember != null) {
                //登录
                return _loginView();
              }else{
                //未登录
                return _noLoginView();
              }
            },
          )
        ),
        Positioned(
            top: 0,
            right: 0,
            child: _settingBtn(context)
        ),
      ],
    );
  }

  //设置按键图标
  Widget _settingBtn(context) {
    return GetBuilder<MemberController>(
      builder: (controller) {
        if(memberController.setIsView) {
          return InkWell(
            onTap: () {
              //打开抽屉
              Scaffold.of(context).openEndDrawer();
            },
            child: Container(
                padding: EdgeInsets.only(right: 15, top: 40),
                child: Icon(Icons.settings, color: Colors.black54,)
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }

  //登录组件
  Widget _loginView() {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(300),
            margin: EdgeInsets.only(top: 50),
            child: ClipOval(
              child: ImageWidget(url: memberController.loginMember.avatar,)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "${memberController.loginMember.nickName}",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  //未登录组件
  Widget _noLoginView() {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(300),
            margin: EdgeInsets.only(top: 40),
            child: ClipOval(
              child: Image.asset("assets/1.0x/images/empty.png",fit: BoxFit.fill,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      }, child: Text("注册")
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text("登录")
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

