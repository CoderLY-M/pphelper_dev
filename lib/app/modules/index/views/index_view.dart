import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/controllers/home_product_controller.dart';
import 'package:pphelper/app/modules/index/views/product_list/product_list_view.dart';
import 'package:pphelper/app/modules/index/views/recommend/recommend_view.dart';
import 'package:pphelper/app/modules/index/views/swiper/swiper_view.dart';
import 'package:pphelper/app/modules/index/views/top_navigator/top_navigator_view.dart';
import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("校园二手交易平台"),centerTitle: true,),
        body: EasyRefresh(
          child: ListView(
            children: [
              SwiperView(),
              TopNavigatorView(),
              RecommendView(),
              ProductListView()
              // ProductsList(productLists: this.productLists,),
            ],
          ),
          //上拉刷新
          onRefresh: () async {
            await Get.find<HomeProductController>().dropDownRefreshProductList();
          },
          //下滑加载
          onLoad: () async {
            //更新数据
            await Get.find<HomeProductController>().refreshProductList();
          },
          footer: BallPulseFooter(),
        )
    );
  }
}
