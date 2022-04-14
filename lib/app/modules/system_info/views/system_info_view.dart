import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/member/views/member_list/member_list.dart';

import '../controllers/system_info_controller.dart';

class SystemInfoView extends GetView<SystemInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('系统信息'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            SetListItemView(title: "版本信息", content: "version1.0x"),
            SetListItemView(title: "版本更新", content: ""),
            SetListItemView(title: "功能介绍", content: ""),
            SetListItemView(title: "反馈", content: ""),
          ],
        ),
      ),
    );
  }
}


class SetListItemView extends StatelessWidget {
  final String title;
  final String content;
  const SetListItemView({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //封装列表展示
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Text("${title}"),
            title: Container(
                transform: Matrix4.translationValues(150, 0, 0),
                child: Text("${content}")
            ),
            trailing: Icon(Icons.chevron_right)
          ),
          Divider(height: 1,),
        ],
      ),
    );
  }
}

