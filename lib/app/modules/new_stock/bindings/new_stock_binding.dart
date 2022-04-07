import 'package:get/get.dart';

import '../controllers/new_stock_controller.dart';

class NewStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewStockController>(
      () => NewStockController(),
    );
  }
}
