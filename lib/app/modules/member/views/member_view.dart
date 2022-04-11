import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/modules/member/views/member_list/member_list.dart';
import 'package:pphelper/app/modules/member/views/member_status/member_status.dart';
import 'package:pphelper/app/modules/member/views/member_top/member_top.dart';

import '../../wallet/controllers/wallet_controller.dart';
import '../controllers/member_controller.dart';
import 'member_bottom_list/member_bottom_list.dart';
import 'member_drawer/member_drawer.dart';

class MemberView extends GetView<MemberController> {
  final MemberController memberController = Get.put(MemberController());
  final WalletController walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MemberDrawerView(),
      body: ListView(
        children: [
          MemberTopView(),
          MemberStatusView(),
          MemberListView(),
          MemberBottomListView()
        ],
      )
    );
  }
}
