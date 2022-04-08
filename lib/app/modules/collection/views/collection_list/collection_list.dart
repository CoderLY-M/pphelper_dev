import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/collection/controllers/collection_controller.dart';
import 'package:pphelper/app/modules/sale/controllers/sale_controller.dart';

import '../collection_item/collection_item.dart';

/**
 * 挂售商品列表
 */
class CollectionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(
      //获取列表数据
        builder: (controller) {
          return Container(
              child: ListView.builder(
                  itemCount: controller.collectionProducts.length,
                  itemBuilder: (builder, index) {
                    if(controller.collectionProducts.length != 0) {
                      return CollectionItemView(collectionProduct: controller.collectionProducts[index],);
                    }else{
                      //没有收藏
                      return Center(
                        child: Text("没有数据"),
                      );
                    }
                  }
              )
          );
        }
    );
  }
}