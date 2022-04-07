import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../service/service_url.dart';
import '../../category/models/category_model.dart';
import '../models/category_product_model.dart';

const DEFAULT_PAGE_NUM = 1;
const PAGE_SIZE = 10;

class CategoryProvider extends GetConnect {

  //获取大类列表
  static Future<List<CategoryModel>> requestCategories() async {
    var response = await Dio().get(servicePath['categories'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return categoryModelFromJson(json.encode(response.data["data"]["lists"]));
    }else{
      throw Exception("获取商品大类数据失败");
    }
  }

  //通过大类id获取小类的商品列表数据
  static Future<List<CategoryProductModel>> requestProductsByCategoryId(String categoryId, {int pageNum = DEFAULT_PAGE_NUM, int pageSize = PAGE_SIZE}) async {
    var response = await Dio().get(
        servicePath['getProductsByCategoryId'].toString(), queryParameters: {
          "cid": categoryId,
          "pageNum": pageNum,
          "pageSize": pageSize
       });
    if (response.statusCode == 200) {
      //获取数据成功
      return categoryProductModelFromJson(json.encode(response.data["data"]["lists"]));
    } else {
      throw Exception("获取分类商品列表数据失败");
    }
  }
}
