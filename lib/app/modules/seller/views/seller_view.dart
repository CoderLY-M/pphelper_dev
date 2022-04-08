import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/seller/views/seller_info/seller_info.dart';
import 'package:pphelper/app/modules/seller/views/seller_product/seller_product.dart';

import '../controllers/seller_controller.dart';

/**
 * 卖家个人页面
 */
class SellerView extends StatefulWidget {
  const SellerView({Key? key}) : super(key: key);

  @override
  _SellerViewState createState() => _SellerViewState();
}

class _SellerViewState extends State<SellerView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  SellerController sellerController = Get.put(SellerController());

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SellerController>(
        builder: (controller) {
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator()
            );
          }else{
            return Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                      expandedHeight: ScreenUtil().setHeight(333),
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text("${controller.sellData.nickName}的空间"),
                        background: Image.asset(
                          'assets/1.0x/images/empty.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: TabBar(
                        labelColor: Colors.black,
                        controller: this.tabController,
                        tabs: <Widget>[
                          Tab(text: '基本信息'),
                          Tab(text: '挂售商品'),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    fillOverscroll: true,
                    child: TabBarView(
                      controller: this.tabController,
                      children: <Widget>[
                        SellInfoView(),
                        SellerProductListView()
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      )
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

