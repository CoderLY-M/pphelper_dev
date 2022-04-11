import 'package:get/get.dart';

import '../controllers/system_info_controller.dart';

class SystemInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemInfoController>(
      () => SystemInfoController(),
    );
  }
}
