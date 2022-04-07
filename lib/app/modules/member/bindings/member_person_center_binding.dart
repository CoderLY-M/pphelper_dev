import 'package:get/get.dart';

import '../controllers/member_controller.dart';

class MemberPersonCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberController>(
      () => MemberController(),
    );
  }
}
