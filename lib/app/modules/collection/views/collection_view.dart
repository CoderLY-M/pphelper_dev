import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/collection/views/collection_list/collection_list.dart';

import '../controllers/collection_controller.dart';

class CollectionView extends GetView<CollectionController> {

  @override
  Widget build(BuildContext context) {
    CollectionController collectionController = Get.put(CollectionController());

    return Scaffold(
        appBar: AppBar(
          title: Text('我的收藏'),
          centerTitle: true,
        ),
        body: Container(
          child: CollectionListView(),
        )
    );
  }
}
