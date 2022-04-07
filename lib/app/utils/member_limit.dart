import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../service/member_service.dart';

/**
 * 工具类鉴权
 */

class MemberLimit {
  //未登录用户鉴权
  static Future<bool> limitNoLoginMember() async{
    var loginMember = await Get.find<MemberService>().getLoginMember();
    if(loginMember != null) {
      return true;
    }else{
      return false;
    }
  }
}