import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';

import '../../controllers/swiper_controller.dart';

class SwiperView extends StatelessWidget{
  final IndexSwiperController swiperController = Get.put(IndexSwiperController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().screenWidth,
      child: GetBuilder<IndexSwiperController>(
        builder: (controller) {
          var swiperLists = swiperController.swiperImageList;
          return Swiper(
            key: UniqueKey(),
            itemBuilder: (BuildContext context,int index){
              return ImageWidget(url: swiperLists[index].imageUrl!);
            },
            itemCount: swiperLists.length,
            scale: 0.7,
            pagination: new SwiperPagination(),
            autoplay: true,
            controller: new SwiperController(),
          );
        },
      )
    );
  }
}
