import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/collection_controller.dart';

class CollectionView extends GetView<CollectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CollectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
