import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/index/models/category_model.dart';
import 'package:pphelper/app/modules/index/models/home_product_model.dart';
import 'package:pphelper/app/modules/index/models/recommend_model.dart';
import 'package:pphelper/app/modules/index/models/swiper_model.dart';
import '../../../service/service_url.dart';

const DEFAULT_PAGE_NUM = 1;
const PAGE_SIZE = 10;

class HomeProvider extends GetConnect {
  //获取录播图图片
  static Future<List<SwiperModel>> requestSwiperImages() async {
    var response = await Dio().get(servicePath['swiperImages'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return swiperModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取轮播图数据失败");
    }
  }

  //获取分类列表数据
  static Future<List<CategoryModel>> requestCategories() async {
    var response = await Dio().get(servicePath['categories'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return categoryModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取分类数据失败");
    }
  }

  //获取推荐商品数据
  static Future<List<RecommendModel>> requestRecommendProducts() async {
    var response = await Dio().get(servicePath['recommendProducts'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return recommendModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取首页推荐商品失败");
    }
  }

  //获取在售商品
  static Future<List<HomeProductModel>> requestSellProducts({int pageNum = DEFAULT_PAGE_NUM, int pageSize = PAGE_SIZE}) async {
    var response = await Dio().get(servicePath['sellProducts'].toString(), queryParameters: {"pageSize": pageSize,"pageNum": pageNum});
    if(response.statusCode == 200) {
      //获取数据成功
      return homeProductModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取首页在售商品失败");
    }
  }

  //更新商品的浏览量
  static Future<void> requestRefreshProductViewCount(String pid) async {
    var response = await Dio().get(servicePath['refreshViewCount'].toString(), queryParameters: {"productId": pid});
    if(response.statusCode == 200) {
      //更新商品浏览量成功
    }else{
      throw Exception("获取首页在售商品失败");
    }
  }
}
