import 'package:get/get.dart';
import 'package:pphelper/app/modules/bus/controllers/bus_controller.dart';

import '../models/product_detail_model.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailController extends GetxController {
  //加载
  var isLoading = false; //是否在加载
  //当前商品
  var productModel;

  //商品数据的改变
  changeCurrentProduct() async{
    try{
      isLoading = true;
      //获取传递的pid值
      var pid = Get.arguments["productId"];
      var product = await ProductDetailProvider.requestGetProductById(pid);
      if(product != null) {
        productModel = product;
      }
    }catch(e) {

    }finally{
      isLoading = false;
      update();
    }
  }

  //添加商品到购物车
  addProductToBus() {
    Get.find<BusController>().addBusProduct(productDetailToBusProduct(productModel));
  }

  @override
  void onInit() {
    super.onInit();
    changeCurrentProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
