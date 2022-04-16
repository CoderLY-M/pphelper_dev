import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../service/service_url.dart';
import '../models/order_detail.dart';

class OrderDetailProvider extends GetConnect {
  //获取录播图图片
  static Future<OrderDetailModel> requestOrderDetail(String orderId) async {
    var response = await Dio().get(servicePath['orderDetail'].toString(), queryParameters: {"orderId": orderId});
    if(response.statusCode == 200) {
      //获取数据成功
      if(response.data["code"] == 200) {
        return OrderDetailModel.fromJson(response.data["data"]["order"]);
      }else{
        throw Exception("获取订单详细数据失败");
      }
    }else{
      throw Exception("获取订单详细数据请求失败");
    }
  }
}
