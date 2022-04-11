import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/order/views/order_product_list/order_product_list.dart';

import '../controllers/order_controller.dart';
import 'order_search/order_search.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  final OrderController orderController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 5, vsync: this);
    initTabberIndex();
  }

  //初始化navgator的下标
  initTabberIndex() {
    //获取下标
    var tabberIndex = Get.arguments["tabberIndex"];
    //更新当前下标
    if(mounted) {
      setState(() {
        tabController.index = tabberIndex;
      });
    }
    orderController.updateTabberIndex(tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OrderSearchView(),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.only(right: 40),
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(50),
              child: Text("搜索",style: TextStyle(color: Colors.black45),)
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: '全部'),
                  Tab(text: '已支付'),
                  Tab(text: '待发货'),
                  Tab(text: '待收货'),
                  Tab(text: '待评价'),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                OrderProductListView(),
                Center(child: Text('还没有数据哦')),
                Center(child: Text('还没有数据哦')),
                Center(child: Text('还没有数据哦')),
                Center(child: Text('还没有数据哦')),
              ],
            ),
          ),
        ],
      ),
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
