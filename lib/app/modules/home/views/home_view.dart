import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/views/bus_view.dart';
import 'package:pphelper/app/modules/index/views/index_view.dart';
import 'package:pphelper/app/modules/member/views/member_view.dart';
import 'package:pphelper/app/modules/message/views/message_view.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import '../../../utils/member_limit.dart';
import '../../category/views/category_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  //页面切换列表
  final List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: "首页"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.rectangle_grid_2x2),
        label: "分类"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bubble_left),
        label: "消息"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.cart),
        label: "购物车"
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        label: "我的"
    ),
  ];

  //页面
  final List<Widget> pages = [
    IndexView(),
    CategoryView(),
    MessageView(),
    BusView(),
    MemberView()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndexPage,
                items: bottoms,
                onTap: (index) {
                  //用户鉴权
                  if(index == 3) {
                    MemberLimit.limitNoLoginMember().then((canPass){
                      if(canPass){
                        HomeController.to.changePageIndex(index);
                      }else{
                        Get.toNamed(Routes.LOGIN);
                      }
                    });
                  }else{
                    HomeController.to.changePageIndex(index);
                  }
                },
              ),
              body: IndexedStack(
                  index: controller.currentIndexPage,
                  children: pages
              )
          );
        }
    );
  }


}
